function envsource
    for line in (grep -v '^#' $argv | grep -v '^\s*$')
        set parts (string split -m 1 '=' -- $line)
        if test (count $parts) -lt 2
            continue
        end
        set key (string trim -- $parts[1])
        set key (string replace -r '^export\s+' '' -- $key)
        set val (string trim -- $parts[2])
        set val (string trim -c '"' -- $val)
        set val (string trim -c "'" -- $val)
        if test -n "$key"
            set -gx $key $val
            echo "Exported key $key"
        end
    end
end
