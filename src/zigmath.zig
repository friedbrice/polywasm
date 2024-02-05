pub export fn helloWorld() void {
    const hello: []const u8 = "hello, world";
    log(hello);
    //log("Hello, Worldz!");
}

fn log(s: []const u8) void {
    const foo: usize = @intFromPtr(&s[0]);
    js_log(foo, s.len);
}

extern fn js_log(a: usize, len: usize) void;

// we'll import this from JS-land

// extern fn console_log_ex(message: [*]const u8, length: u8) void;

// // we'll export this to JS-land
// export fn add(a: i32, b: i32) i32 {
//     const log = "happy happy joy joy";
//     console_log_ex(log, log.len);
//     return a + b;
// }
