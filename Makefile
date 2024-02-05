game.wasm: game.rs math.rs
	rm -f game.wasm math.wasm
	rustc -C opt-level=s --target wasm32-unknown-unknown game.rs
	rustc -C opt-level=s --target wasm32-unknown-unknown math.rs

zigmath.wasm: zigmath.zig
	zig build-lib zigmath.zig -target wasm32-freestanding -dynamic
