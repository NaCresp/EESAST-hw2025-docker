SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

docker build -t hw_copy_image -f "$SCRIPT_DIR/Dockerfile" "$SCRIPT_DIR/.."

echo "Running add program:"
docker run --rm hw_copy_image ./add 5 3

echo "Running mul program:"
docker run --rm hw_copy_image ./mul 5 3