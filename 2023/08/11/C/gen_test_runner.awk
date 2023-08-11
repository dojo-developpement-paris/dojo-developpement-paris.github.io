#!/usr/bin/awk -f

function strip(str) {
    sub(/^ */, "", str)
    sub(/ *$/, "", str)
    return str
} 

BEGIN {
    FS = "[(),]"
    inAGroup = 0
    print "#include \"unity_fixture.h\"\n"
}

/TEST_GROUP\(/ {
    groupId = strip($(NF-1))
    if (inAGroup) { print "}" }
    inAGroup = 1
    print "TEST_GROUP_RUNNER(" groupId ") {"
}

/TEST\(/ {
    groupId = strip($(NF-2))
    testId  = strip($(NF-1))
    print "    RUN_TEST_CASE(" groupId ", " testId ");"
}

END {
    if(inAGroup) { print "}" }
}
