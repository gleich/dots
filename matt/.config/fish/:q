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
