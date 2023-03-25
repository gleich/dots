set -l dir /Users/matt/src
for file in $dir/*
    if test -d $file -a ! -L $file
        if test -d $file/.git
            # Include Git directories in command completions
            echo (basename $file)
        else
            # Offer completions for non-Git directories
            echo (basename $file)
        end
    end
end
