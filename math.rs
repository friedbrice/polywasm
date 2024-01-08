#![no_main]
#![no_std]

use core::panic::PanicInfo;

#[panic_handler]
fn panic(_panic: &PanicInfo<'_>) -> ! {
    loop {}
}

#[no_mangle]
pub unsafe extern "C" fn helloWorld() {
    js_log(b"hello, world!");
    js_log(b"Hello, Worldz!");
}

#[allow(dead_code)]
    extern "C" {
        fn js_log(x: &[u8]);
    }
