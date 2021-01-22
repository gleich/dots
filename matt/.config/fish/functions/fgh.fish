function fcd
  if ! cd (fgh ls $argv) > /dev/null
    echo "Failed to find repository"; return 1
  end
end
