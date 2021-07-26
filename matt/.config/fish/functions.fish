# cd to a config folder with ease
function conf
	cd ~/.config/"$argv"
end

# Copy a file to the clipboard
function ccat
	CAT $argv | pbcopy
end

# Open a repo found with fgh in vscode
function fcode --wraps "fgh ls"
	if ! code (fgh ls $argv) > /dev/null
		echo "Failed to find repository"; return 1
	end
end

# cd to a rpeo found with fgh
function fcd --wraps "fgh ls"
  if ! cd (fgh ls $argv) > /dev/null
    echo "Failed to find repository"; return 1
  end
end

# run some common go commands
function gop
	golangci-lint run
	go mod tidy
end

# replace text recursively with ease
function repall
	grep -rl $argv[1] ./ | LC_ALL=C xargs sed -i '' 's/'$argv[1]'/'$argv[2]'/g'
end

# Instead of hard deleting things just move them to ~/.Trash
function rm
	mv $argv[1] ~/.Trash
end
