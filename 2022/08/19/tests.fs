
require ffl/tst.fs


char I  constant R_I
char V  constant R_V
char X  constant R_X
char L  constant R_L

\ 3 = III
\ 4 = IV
\ 6 = VI
\ 7 = VII
\ 9  IX
0 constant n-a
create roman-digits n-a c,  

: roman-numeral ( u -- c )
  dup           \ u u 
  1 =           \ u b
  if            \ u 
    drop        \ 
    R_I         \ I
  else          \ u
    dup 5 =     \ u,b
    if          \ 
      drop      \ 
      R_V       \ V
    else
      10 =      \ b
      if
        R_X    \ X
      else
        R_L
      endif
    endif
  endif
;

page
( this is: a comment ) 
t{ 
  ." this is a dummy test" cr
  4 4 ?s
}t

." roman-numeral" cr
t{
  ."    given 1 return I" cr
  1 roman-numeral R_I ?s
}t
t{
  ."    given 5 return V" cr
  5 roman-numeral R_V ?s
}t

t{
  ."    given 10 return X" cr
  10 roman-numeral R_X ?s
}t

t{
  ."    given 50 return L" cr
  50 roman-numeral R_L ?s
}t

bye

