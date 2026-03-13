ENTRY(Reset_Handler)

MEMORY
{
    FLASH (rx)  : ORIGIN = 0x08000000, LENGTH = 128K
    RAM   (rwx) : ORIGIN = 0x20000000, LENGTH = 96K
}

SECTIONS
{
    /* . = vma*/
/* kernel space */

    .isr_vector :
    {
        _sFLASHKernelSpace = .;
        KEEP(*(.isr_vector))
    } > FLASH

    .text :
    {
        *(.text*)
    } > FLASH

    .rodata :
    {
        *(.rodata*)
    } > FLASH

    .ARM.exidx :
    {
        *(.ARM.exidx*)
    } > FLASH

    _sidata = LOADADDR(.data);

    .data :
    {
        _sdata = .;
        _sSRAMKernelSPACE = .;
        *(.data*)
        _edata = .;
    } > RAM AT > FLASH

    .bss (NOLOAD) :
    {
        _sbss = .;             
        *(.bss*)
        *(COMMON)
        _ebss = .;
    } > RAM

    _FLASHKernelSpaceSize = SIZEOF (.isr_vector) + SIZEOF (.text) + 
                            SIZEOF (.rodata) + SIZEOF (.data);
    _SRAMKernelSpaceSize = SIZEOF (.bss) + SIZEOF (.data);

/*user space*/

    .usertext :
    {
        _sFLASHUserSpace = .;
        *(.usertext*)
    }> FLASH
    .userrodata :
    {   
        *(.userrodata*)
    }>FALSH

    _siuserdata = LOADADDR (.userdata);

    .userdata :
    {
        _sSRAMUserSpace = .;
        _suserdata = .;
        *(.userdata*)
        _euserdata = .;
    }> RAM AT > FLASH
    .userbss (NOLOAD) :
    {
        _suserbss = .;
        *(.userbss*)
        _euserbss = .;
    }> RAM

    _FLASHUserSpaceSize = SIZEOF (.usertext) + SIZEOF (.userrodata) + SIZEOF (.userdata);
    _SRAMUserSpaceSize = SIZEOF (.userbss) + SIZEOF (.userdata);
    
    _estack = ORIGIN(RAM) + LENGTH(RAM);
}

