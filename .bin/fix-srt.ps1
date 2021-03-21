[CmdletBinding(SupportsShouldProcess)]
param(
  [Parameter(Position=0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
  [ValidateNotNullOrEmpty()]
  [SupportsWildcards()]
  [string[]]
  $Path = $PWD
)

filter Get-FileEncoding {
  [CmdletBinding()]
  [OutputType([System.Text.Encoding])]
  param(
      [Parameter(Mandatory, Position=0, ValueFromPipelineByPropertyName)]
      [Alias("PSPath")]
      [ValidateNotNullOrEmpty()]
      [string[]]
      $LiteralPath
  )
  $LiteralPath | ForEach-Object {
    $bom = Get-Content -LiteralPath $_ -AsByteStream -ReadCount 4 -TotalCount 4
    # UTF-8 format without Byte Order Mark
    if ($bom[0] -eq 0xef -and $bom[1] -eq 0xbb -and $bom[2] -eq 0xbf )
    { return [System.Text.Encoding]::UTF8 }
    # UTF-16 format using the big-endian byte order
    if ($bom[0] -eq 0xfe -and $bom[1] -eq 0xff)
    { return [System.Text.Encoding]::BigEndianUnicode }
    # UTF-16 format using the little-endian byte order
    if ($bom[0] -eq 0xff -and $bom[1] -eq 0xfe)
    { return [System.Text.Encoding]::Unicode }
    # UTF-32 format using the big-endian byte order
    if ($bom[0] -eq 0 -and $bom[1] -eq 0 -and $bom[2] -eq 0xfe -and $bom[3] -eq 0xff)
    { return [System.Text.UTF32Encoding]::new($true, $true) }
    # UTF-32 format using the little-endian byte order
    if ($bom[0] -eq 0xfe -and $bom[1] -eq 0xff -and $bom[2] -eq 0 -and $bom[3] -eq 0)
    { return [System.Text.Encoding]::UTF32 }
    # UTF-7 format
    if ($bom[0] -eq 0x2b -and $bom[1] -eq 0x2f -and $bom[2] -eq 0x76 -and $bom[3] -in 0x38, 0x39, 0x2b, 0x2f)
    { return [System.Text.Encoding]::UTF7 }
    # UTF-8 format without Byte Order Mark (BOM)
    return [System.Text.UTF8Encoding]::new($false)
  }
}

Get-ChildItem -Path $Path -Include "*.srt" -Recurse -File `
| ForEach-Object {
  $encoding = $_ | Get-FileEncoding
  $content  = $_ | Get-Content -Raw -Encoding $encoding
  $content -match "(?m)(\r?\n)?(\r?\n)?\z" | Out-Null
  if ($Matches.2) {
    "$_ is OK" | Write-Debug
  } else {
    $missing = if ($Matches.1) { 1 } else { 2 }
    $newline = if ($content -match "(?m)[^\r]\n") { "LF" } else { "CRLF" }
    "Fixing $_ ($newline)..."
    $newline = if ($newline -eq "LF") { "`n" } else { "`r`n" }
    if (!$WhatIfPreference) {
      $_ | Add-Content -Value ($newline * $missing) -NoNewline
    }
  }
}
