#![no_main]
#![no_std]

use core::panic::PanicInfo;

#[panic_handler]
fn panic(_panic: &PanicInfo<'_>) -> ! {
    loop {}
}

#[no_mangle]
pub unsafe extern "C" fn helloWorld() {
    log(&"hello, world!");
    log(&"Hello, Worldz!");
}

fn log(s: &str) {
    unsafe {
        js_log(s.as_ptr(), s.len())
    }
}

#[allow(dead_code)]
    extern "C" {
        fn js_log(ptr: *const u8, len: usize);
    }


