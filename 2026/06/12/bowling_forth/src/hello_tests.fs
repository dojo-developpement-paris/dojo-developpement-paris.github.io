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

tst-get-result

(bye)
