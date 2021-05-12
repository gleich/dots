function jrun
    set -l binary_name (string trim --right --chars=".java" $1)
    javac $1
    java $binary_name
    rm *.class
end
