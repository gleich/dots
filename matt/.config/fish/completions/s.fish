function _my_cd_completion
  set -l dir ~/src
  for file in $dir/*
    if test -d $file
      echo $file
    end
  end
end

complete -f -n '_my_cd_completion' s

