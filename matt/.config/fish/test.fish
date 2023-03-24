set -l dir /Users/matt/src
for file in $dir/*
    if test -d $file
        echo $file
    end
end
