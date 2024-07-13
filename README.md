# Basic Raylib + WASM

A basic template to create WebAssembly using Raylib and emscripten

## Building

The command below will create three files: `basicwasm.html`, `basicwasm.js`, and `basicwasm.wasm`.

```shell
./build.sh
```
## Running

You can use any HTTP server. For instance, the Python one:

```shell
python -m http.server 5555
```
Then access [http://localhost:5555/basicwasm.html](http://localhost:5555/basicwasm.html)

