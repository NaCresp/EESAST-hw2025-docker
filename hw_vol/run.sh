SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

docker build -t hw_vol_image -f "$SCRIPT_DIR/Dockerfile" "$SCRIPT_DIR/.."

docker run --rm -v "$(pwd)/../src":/src hw_vol_image g++ mul.cpp -o mul

if [ -f ../src/mul ]; then
    echo "Compilation successful. Executable 'mul' created in src directory."
    echo "Running compiled program on host:"
    ../src/mul 6 7
else
    echo "Compilation failed."
fi

docker run --rm -v "$(pwd)/../src":/src hw_vol_image g++ add.cpp -o add
if [ -f ../src/add ]; then
    echo "Compilation successful. Executable 'add' created in src directory."
    echo "Running compiled program on host:"
    ../src/add 6 7
else
    echo "Compilation failed."
fi