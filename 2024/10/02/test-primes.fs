
REQUIRE ffl/tst.fs
REQUIRE primes.fs

            
." small composites" CR
T{
    4 IS-PRIME? ?FALSE
    6 IS-PRIME? ?FALSE
    9 IS-PRIME? ?FALSE
}T

." small primes" CR
T{ 
    2 IS-PRIME? ?TRUE
    3 IS-PRIME? ?TRUE
    5 IS-PRIME? ?TRUE
}T

." big primes" CR
T{
    999983 IS-PRIME? ?TRUE
}T

." prime count" CR
T{
    100 PRIME-COUNT 25 ?S
    1000 PRIME-COUNT 168 ?S
    78498   1000000 PRIME-COUNT ?S
}T
bye
