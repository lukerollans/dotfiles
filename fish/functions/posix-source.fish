function posix-source
  for i in (cat $argv)
    set arr (echo $i |tr = \n)
    if test -n "$arr[1]"
      echo Setting $arr[1]
      set -gx $arr[1] $arr[2]
    end
  end
end
