
REQUIRE ffl/tst.fs

: SQUARE ( n -- n² )
    DUP * ;

: IS-PRIME? ( n -- f )
    ASSERT( DUP 1 <> )
    DUP 2 = IF
        DROP TRUE
    ELSE 
        DUP 2        \  n,max…2
        DO           \  n
           I SQUARE OVER > IF 
               LEAVE
           ENDIF
           DUP I    \  n,n,i
           MOD      \  n,r
           0= IF
              DROP 0 \ 0
              LEAVE
           ENDIF
        LOOP 
    ENDIF ;

: PRIME-COUNT ( max -- n )
    0 SWAP         \ counter,max
    1+ 2           \ max+1…2
    DO                    \ counter
        I IS-PRIME? IF    
            1+             \ counter'
        ENDIF
    LOOP ;

: .PRIMES ( n -- )
    1+ 2 DO
        I IS-PRIME? IF
            I .
        ENDIF
    LOOP ;
            

