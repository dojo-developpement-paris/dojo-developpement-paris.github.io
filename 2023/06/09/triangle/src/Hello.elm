module Hello exposing (MaybeName, hello)


type alias MaybeName =
    Maybe String


hello : MaybeName -> String
hello maybeName =
    case maybeName of
        Just name ->
            "Hello " ++ name

        Nothing ->
            hello (Just "world")
