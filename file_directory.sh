FILE_PATH="$(readlink -f "$BASH_SOURCE")"
FILE_NAME="$(basename "$FILE_PATH")"
REPO_ROOT="$(dirname "$FILE_PATH")"


echo "File path: $FILE_PATH"
echo "File name: $FILE_NAME"
echo "Repo root: $REPO_ROOT"