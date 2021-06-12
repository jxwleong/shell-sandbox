# Ref: https://sookocheff.com/post/bash/parsing-bash-script-arguments-with-shopts/
# https://sookocheff.com/post/bash/parsing-bash-script-arguments-with-shopts/
# https://stackoverflow.com/a/16496491
# https://unix.stackexchange.com/a/621007
usage() { echo "Usage: $0 [-t <timeout>]" 1>&2; exit 1;}

while getopts ":ht:" opt; do
  case ${opt} in
    h )
      echo "Usage:"
      echo "    $0 -h                      Display this help message."
      echo "    $0 -t <decimal>		   Timeout in second(s)."
      exit 0
      ;;
    t )
      timeout=${OPTARG}
      ;;
    \? )
      echo "Invalid Option: -$OPTARG" 1>&2
      exit 1
      ;;
  esac
done
shift $((OPTIND -1))

if [ -z $timeout ]; then
    usage
fi

re='^[0-9]+$'
if ! [[ $timeout =~ $re ]] ; then
   echo "error: '$timeout' is not decimal" >&2; exit 1
fi

echo "Delaying for $timeout seconds."
sleep $timeout
echo "Timesup!"
exit 0
