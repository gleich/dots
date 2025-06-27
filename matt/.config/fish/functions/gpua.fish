function gpua
    for d in */ 
        if test -d $d/.git
            echo "Pulling in $d"
            pushd $d > /dev/null
            git pull
            popd  > /dev/null
        end
    end
end

