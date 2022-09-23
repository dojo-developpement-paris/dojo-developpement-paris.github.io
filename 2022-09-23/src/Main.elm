module Main exposing (hello)


hello : Maybe String -> String
hello maybeName =
    case maybeName of
        Just name ->
            "Hello " ++ name

        Nothing ->
            hello (Just "world")
