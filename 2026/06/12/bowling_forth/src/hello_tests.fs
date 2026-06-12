\ ffl/tst.fs
\ needed for Vim to syntax highligth Forth instead of F#

require ffl/tst.fs

: hello ( source,length -- dest,length )
    dup                 \ source,length,length
    s" Hello " pad place
    0= if
        2drop
        s" world"
    then
    pad +place
    pad count
;

." Hello world" cr
t{
    s" " hello
    s" Hello world" ?str
}t

." Hello foo" cr
t{
    s" foo" hello
    s" Hello foo" ?str
}t

." Hello bar" cr
t{
    s" bar" ( hex dbg ) hello
    s" Hello bar" ?str
}t

tst-get-result

(bye)
