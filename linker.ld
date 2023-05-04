/* linker.ld */
ENTRY(main)

SECTIONS
{
    . = 0x80000000;
    .text : {
        *(.text)
    }

    . = 0x80001000;
    .data : {
        *(.data)
    }

    .tohost (NOLOAD) : {
        . = ALIGN(4);
        tohost = .;
        LONG(0);
        . = ALIGN(4);
        fromhost = .;
        LONG(0);
    }
}
