set -l paths /usr/syno/sbin /usr/syno/bin /usr/local/sbin /usr/local/bin ~/.bin
for path in $paths
	if test -d $path
		if not contains -- $path $PATH
			set PATH $PATH $path
		end
	end
end
