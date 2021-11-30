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

# replace text recursively with ease
function repall
	grep --exclude-dir=.git -rl $argv[1] ./  | LC_ALL=C xargs sed -i '' 's/'$argv[1]'/'$argv[2]'/g'
end

# Make a new git release
function release
	git tag -a $argv[1] -m $argv[1]
	git push origin $argv[1]
end

# go to the top of a project
function gcd; cd (git rev-parse --show-toplevel); end

# Open a document in zathura and have kiwi build on save
function work_on
	zathura (
		string replace docs/ pdfs/ (
			string replace .md .pdf (
				string replace .tex .pdf $argv[1]
			)
		)
	) &
	fswatch -o $argv[1] | xargs -n1 -I{} /Users/matt/src/gleich/public/shell/scripts/kiwi-build.fish
end

