
async function start() {
    var memoryView = new Uint8Array();
    const utf8decoder = new TextDecoder();
    function log(stringAddr, stringLen) {
        let bytes = memoryView.subarray(stringAddr, stringAddr+stringLen);
        console.log(utf8decoder.decode(bytes))
    }
    const math = await WebAssembly.instantiateStreaming(
        fetch("zig-out/lib/zigmath.wasm"),
        {
            "env": {
                "js_log": log
            }
        });
    memoryView = new Uint8Array(math.instance.exports.memory.buffer);
    math.instance.exports.helloWorld();
}

start().catch((e) => console.log(e));
