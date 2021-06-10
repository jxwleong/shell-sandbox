# REF: https://riptutorial.com/bash/example/19531/a-function-that-accepts-named-parameters
foo() {
  while [[ "$#" -gt 0 ]]
  do
    case $1 in
      -f|--follow)
        local FOLLOW="following"
        ;;
      -t|--tail)
        local TAIL="tail=$2"
        ;;
    esac
    shift
  done

  echo "FOLLOW: $FOLLOW"
  echo "TAIL: $TAIL"
}

return_0() {
 return 0
}

foo -f -t aaa

if  return_0 ;
then
  echo 0
else
  echo 1
fi
