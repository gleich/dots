function envsource
  for line in (cat $argv | grep -v '^#' |  grep -v '^\s*$' | sed -e 's/=/ /' -e "s/'//g" -e 's/"//g' )
    set export (string split ' ' $line)
    set -gx $export[1] $export[2]
    echo "Exported key $export[1]"
  end
end
