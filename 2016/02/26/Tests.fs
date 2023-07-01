\ gforth Tests.fs

\  10               10
\ 101              110
\ 111              111

\  _    _  _     _  _  _  _  _
\ | | | _| _||_||_ |_   ||_||_|
\ |_| ||_  _|  | _||_|  ||_| _| 
            
\ 10101111 AF

CHAR | CONSTANT PIPE 
CHAR _ CONSTANT UNDERSCORE

S" BankOcr.fs" REQUIRED

: TESTS
    ASSERT( BL         BAR? 0= )
    ASSERT( PIPE       BAR? 1 = )
    ASSERT( UNDERSCORE BAR? 1 = )
    
    [ 2 BASE ! ]
    ASSERT( 1 000000000 <<BIT! 00000001 = )
    ASSERT( 1 000000100 <<BIT! 00001001 = )
    ASSERT( 0 000000111 <<BIT! 00001110 = )

    ASSERT( S" _" 0 <<BITS!  00000001 = ) 
    ASSERT( S" _" 1 <<BITS!  00000011 = )
    ASSERT( S"  " 1 <<BITS!  00000010 = )
    ASSERT( S" __" 0 <<BITS! 00000011 = )
    [ DECIMAL ] 
;
TESTS
." SUCCESS" 
BYE

