
require ffl/tst.fs
require Sokoban.fs

page

T{ ." workerx give the worker's x coordinate" CR
    init-sokoban
    workerx @ 1 ?S
}T
T{ ." workery give the worker's y coordinate" CR
    init-sokoban
    workery @ 1 ?S
}T
T{ ." initially direction is 0 0" CR
    init-sokoban
    directionx @ 0 ?s
    directiony @ 0 ?s
}T
T{ ." when i is typed, direction is 0 -1" CR
    init-sokoban
    key-up interpret-key
    directionx @  0 ?S    directiony @ -1 ?S
}T
T{ ." when ? is typed, direction is 0 1" CR
    init-sokoban
    key-down interpret-key
    directionx @  0 ?S   directiony @  1 ?S
}T
T{ ." when j is typed, direction is -1 0" CR
    init-sokoban
    key-left interpret-key
    directionx @  -1 ?S   directiony @ 0 ?S
}T
T{ ." when k is typed, direction is 1 0" CR
    init-sokoban
    key-right interpret-key
    directionx @  1 ?S   directiony @ 0 ?S
}T
T{ ." when any other key is typed, direction is 0 0" CR
    init-sokoban
    char x interpret-key
    directionx @  0 ?S   directiony @ 0 ?S
}T
T{ ." when moving worker, coordinates change" CR
    init-sokoban
    1 directionx !  move-worker
    workerx @ 2 ?s
    workery @ 1 ?s

    -1 directiony !  move-worker
    workery @ 0 ?s 
}T

T{ ." when crate in the direction, sokoban pushes the crate" CR
   init-sokoban
    2 cratex ! 1 cratey !
    key-right interpret-key move-worker
    cratex @ 3 ?s 
}T 
    
T{ ." crates don't move if sokoban doesn't push them" CR
   init-sokoban 
    2 cratex ! 1 cratey !
    key-left interpret-key move-worker
    cratex @ 2 ?s 
}T 
    
T{ ." crates don't move if sokoban doesn't push them" CR
   init-sokoban 
    2 cratex ! 2 cratey !
    key-right interpret-key move-worker
    cratex @ 2 ?s 
}T 



bye
