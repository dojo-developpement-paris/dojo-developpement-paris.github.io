\ BankOcr.fs

: BAR? ( c -- 0|1 )
    BL <> 1 AND ;

: <<BIT! ( b,byte -- byte' )
    1 LSHIFT OR ;

: #BAR? ( addr,n -- b )
    + C@ BAR? ;
: <<BITS! ( addr,n,byte -- byte' )
    SWAP 0 DO
        OVER I #BAR?
        SWAP <<BIT!
    LOOP NIP ;

