ENTRY(Reset_Handler)

MEMORY
{
    FLASH (rx)  : ORIGIN = 0x08020000, LENGTH = 128K    /*change origin to 0x08020000*/
    RAM   (rwx) : ORIGIN = 0x20000000, LENGTH = 96K
}

SECTIONS
{
    /* . = vma*/
/* kernel space */
    _header_start = ORIGIN (FLASH) ;
    .Header :
    {
        KEEP (*(.Header))
    }> FLASH

    .isr_vector ALIGN (256) :
    {
        _sFLASHKernelSpace = .;
        _svtable = .;
        KEEP(*(.isr_vector))
        _evtable = .;
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
        _sSRAMKernelSpace = .;
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
    }>FLASH

    _siuserdata = LOADADDR (.userdata);

    .userdata :
    {
        . = ORIGIN(RAM) + 16K;

        _sSRAMUserSpace = .;
        _suserdata = .;
        *(.userdata*)
        _euserdata = .;
    }> RAM AT > FLASH

    .fx_end :
    {
        . = ALIGN (4);
        _firmware_end = .;
    }> FLASH

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

