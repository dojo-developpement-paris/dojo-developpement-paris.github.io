defmodule SokobanTest do
  use ExUnit.Case

  test "generate a level" do
    assert Sokoban.map() == """
    ####
    #@ #
    ####
    """
  end

  test "move the character to the right" do
    new_level =
      Sokoban.map()
      |> Sokoban.move(:right)

    assert new_level  == """
    ####
    # @#
    ####
    """
  end

  test "move right then left leaves us where we started" do
    new_level =
      Sokoban.map()
      |> Sokoban.move(:right)
      |> Sokoban.move(:left)

    assert new_level  == """
    ####
    #@ #
    ####
    """
  end

  test "find the character's position" do
    level = """
    ####
    #@ #
    ####
    """
    assert Sokoban.character_position(level) == {1,1}
  end
end
