#![no_std]
#![no_main]

use core::arch::global_asm;
use core::panic::PanicInfo;

/*global_asm!(
    ".section .init
    .global _start

    _start:
        la sp, _stack_top
        call main
        j .

    .section .stack
    _stack_top:
        .space 0x1000
"
);*/

#[no_mangle]
pub unsafe extern "C" fn main() -> ! {


    let _x = 42u32 ;

    //panic!();

        // can't return so we go into an infinite loop here
    loop {
        core::arch::asm!("nop");
    }
}

// The reset vector, a pointer into the reset handler
/*#[link_section = ".vector_table.reset_vector"]
#[no_mangle]
pub static RESET_VECTOR: unsafe extern "C" fn() -> ! = Reset;
*/

#[panic_handler]
fn panic(_panic: &PanicInfo<'_>) -> ! {
    loop {}
}
