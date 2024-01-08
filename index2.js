async function start() {
    const math = await WebAssembly.instantiateStreaming(
        fetch("math.wasm"),
        {
            "env": {
                "js_log": console.log
            }
        });

    math.instance.exports.helloWorld();
}

start().catch((e) => console.log(e));
