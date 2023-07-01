module Dummy exposing (..)

import Expect
import Test exposing (..)

-- todo
-- objectives: given an object with a mass, this mass should be displayed as a circle in the middle of a page
--      -- can I draw a circle in the middle of the page
--      -- circle size should be proportional to its mass (r = sqrt(m) )

import Main exposing (..)

myTest _ = "left" |> Expect.equal "left"

dummy : Test
dummy = 
    describe "all our tests" 
        [describe "dummy test"
            [test "This test will show the existence of a test harness" 
                myTest ],

        describe "an object" 
            [test "its mass should influence its radius"
                ( \_ -> radius (object 16) |> Expect.equal 4) ,
            test "its mass should influence its radius for any mass"
                ( \_ -> radius (object 25) |> Expect.equal 5) ]
                ]
