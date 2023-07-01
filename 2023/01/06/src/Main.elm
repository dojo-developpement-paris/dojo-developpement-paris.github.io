module Main exposing (suggere)

import List exposing (head, reverse)
import String exposing (append, split)


suggere : String -> Maybe String
suggere email =
    let
        splitted =
            split "@" email
    in
    case head (reverse splitted) of
        "gamil.com" ->
            Just (append (head splitted) "@gmail.com")

        "gmal.com" ->
            Just (append (head splitted) "@gmail.com")

        _ ->
            Nothing
