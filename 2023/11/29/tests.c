//
// Created by miche on 29/11/2023.
//

#include <assert.h>
#include <stdbool.h>
#include "JSON.h"

int main(int argc, char** argv) {
    assert(validateJson("{\"name\":42}") == true);
    assert(validateJson("{\"name\":17") == false);
    assert(validateJson("\"name\":17}") == false);
    assert(validateJson(" {\"name\":42} ") == true);
    assert(validateJson(" {\"name\":42}") == true);
    assert(validateJson(" a{\"name\":42}") == false);
    assert(validateJson(" {\"name\":42}a") == false);
    assert(validateJson(" {,\"name\":42}") == false);
    assert(validateJson(" {{\"name\":42}") == false);
    assert(validateJson("{}") == true);
    assert(validateJson(" {n:42}") == false);
    assert(validateJson(" {\"n:42}") == false);
    assert(validateJson(" {\"n\":42}") == true);
    assert(validateJson(" {\"n:\"42}") == false);
    assert(validateJson(" {\"\"42}") == false);
    //assert(validateJson(" {\"n\":}") == false);
    return 0;
}
