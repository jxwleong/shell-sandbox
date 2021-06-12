# https://stackoverflow.com/a/39398359
# As long as there is at least one more argument, keep looping
FILE_PATH="$(readlink -f "$BASH_SOURCE")"
FILE_NAME="$(basename "$FILE_PATH")"
FILE_VERSION=v21.06.12
REPO_ROOT="$(dirname "$FILE_PATH")"


__usage="Usage: $FILE_NAME [OPTIONS]

Options:
  -m, --mprime-path <path>	Path for mprime executable file
  -v, --version			Display $FILE_NAME version
  -h, --help			Display this message
"
usage() {
    echo "Usage: $FILE_NAME [-m path | --mprime-path path] [-h | --help]"
    echo ""
    echo "Options:"
    echo "-m path, --mprime-path path   Path of mprime executable file"
    echo "-h, --help			Display this message"
    echo "b	bar"
}

# If no arguments was pass
if [[ $# -eq 0 ]]; then
    echo "$__usage"
    exit 1
fi

while [[ $# -gt 0 ]]; do
    key="$1"
    case "$key" in
	-h|--help)
	echo "$__usage"
	exit 0
	;;
        -m|--mprime-path)
	shift
	if [ ! -f "$1" ]; then
            echo "Invalid path '$1' given to [-m | --mprime-path]"
            exit 1
	fi
	MPRIME_PATH="$1"
	;;
	-v|--version)
	echo "Version: $FILE_VERSION"
	exit 0
	;;

	# This is an arg value type option. Will catch -o value or --output-file value
        -o|--output-file)
        shift # past the key and to the value
        OUTPUTFILE="$1"
        ;;
        # This is an arg=value type option. Will catch -o=value or --output-file=value
        -o=*|--output-file=*)
        # No need to shift here since the value is part of the same string
        OUTPUTFILE="${key#*=}"
        ;;
        *)
        # Do whatever you want with extra options
        echo "Unknown option '$key'"
	exit 1
        ;;
    esac
    # Shift after checking all the cases to get the next option
    shift
done

echo $MPRIME_PATH
