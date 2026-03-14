ENTRY(Reset_Handler)

MEMORY
{
    FLASH (rx)  : ORIGIN = 0x08000000, LENGTH = 128K    /*change origin to 0x08020000*/
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

    _FLASHKernelSpaceSize = 64K ;
    _SRAMKernelSpaceSize = 16K ;

/*user space*/

    .usertext :
    {
        . = ALIGN (64K);
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
        . = ORIGIN(RAM) + 16K;

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

    _FLASHUserSpaceSize = 64K;
    _SRAMUserSpaceSize = 16K ;
    
    _estack = ORIGIN(RAM) + LENGTH(RAM);
}

