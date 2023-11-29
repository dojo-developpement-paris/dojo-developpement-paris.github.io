//
// Created by miche on 29/11/2023.
//

#include <string.h>
#include <stdbool.h>

int validateJson(char* JSONString) {
    int openBrace = 0;
    int closedBrace = 0;
    int quotes = 0;
    int key = 0;
    int colon = 0;
    bool inVar = false;
    for(int i = 0; i < strlen(JSONString); i++) {
        switch(JSONString[i]) {
            case ' ':
                break;
            case '{':
                openBrace++;
                break;
            case '}':
                closedBrace++;
                break;
            case ',':
                return false;
            case '\"':
                if(!inVar) {
                    inVar = true;
                }else {
                    key++;
                    inVar = false;
                }
                break;
            case ':':
                colon++;
                if(!key) return false;
                break;
            default:
                if(openBrace == 0) return false;
                if(closedBrace > 0) return false;
        }
    }


    return (openBrace > 0 && closedBrace == openBrace) && colon == key;
}
