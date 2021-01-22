function jrun
    set BINARY_NAME "${1:0:-5}"
    javac $1
    java $BINARY_NAME
    rm $BINARY_NAME
end
