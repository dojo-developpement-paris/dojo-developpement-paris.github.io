
variable workerx
variable workery
variable cratex
variable cratey
variable directionx
variable directiony

char i constant key-up
char ? constant key-down
char j constant key-left
char k constant key-right

char @ constant worker
32     constant ground
char $ constant crate

: init-sokoban 
    1 workerx !  1 workery ! 
    3 cratex ! 3 cratey !
    0 directionx ! 0 directiony ! ;

: interpret-key \  k -- changes directionx and y
    0 directionx !
    0  directiony !
    dup key-up = if
        drop
        -1 directiony !
    else dup key-down = if
        drop
        1 directiony !
    else dup key-left = if
        drop
        -1 directionx !
    else key-right = if
        1 directionx !
    endif endif endif endif ;

: move-worker 
    directionx @ workerx +! 
    directiony @ workery +! 
    cratex @ workerx @ = 
    cratey @ workery @ = and if 
        directionx @ cratex +!
        directiony @ cratey +!
    endif ;

: cursor-origin
    0 0 at-xy ;

: .worker
    workerx @ workery @ at-xy worker emit
    cursor-origin ;

: .crate
    cratex @ cratey @ at-xy crate emit 
    cursor-origin ;

: hide-worker
    workerx @ workery @ at-xy ground emit ;

: game-loop
    .worker .crate
    begin
        key interpret-key 
        hide-worker
        move-worker 
        .crate
        .worker
    again ;
    
: start-game
    init-sokoban page game-loop ; 
    

