module TrianglePascal where

pascalTriangle n = take n t
  where t = [1]:[nextLine l | l <- t]
        nextLine l = zipWith (+) (0:l)  (l++[0])
