#!/usr/bin/awk -f

BEGIN {
    FS = "[() ,]"
    print "#include \"unity_fixture.h\"\n"
    print "static void RunAllTests(void) {"
}

/TEST_GROUP\(/ {
    groupId = $(NF-1)
    print "    RUN_TEST_GROUP(" groupId ");"
}

END {
    print "}\n"
    print "int main(int argc, const char *argv[]) {"
    print "    return UnityMain(argc, argv, RunAllTests);"
    print "}"
}
