/* 1K = 1 KiBi = 1024 bytes */
MEMORY
{
  FLASH : ORIGIN = 0x20000000, LENGTH = 32M
  RAM : ORIGIN = 0x80000000, LENGTH = 16K
}

/* The entry point is the reset handler */
ENTRY(main);

EXTERN(RESET_VECTOR);

SECTIONS
{
  .text :
  {

    *(.text .text.*);
  } > FLASH

  .test_var :
  {
     LONG(0xDEADBEEF);
  } > FLASH

 /* .data :
  {
    *(.data .data.*);
  } > RAM

  .bss : { *(.bss .bss.*) } > RAM
*/
/*
  RAM_END = ORIGIN(RAM) + LENGTH(RAM) - 1;
*/
  /*.stack : AT(ORIGIN(RAM))
  {
    . += 0x1000;
  } > RAM*/

}
