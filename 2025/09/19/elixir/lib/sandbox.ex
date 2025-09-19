defmodule Sokoban do
  def map() do
    """
    ####
    #@ #
    ####
    """
  end


  def move(_map, :right) do
    """
    ####
    # @#
    ####
    """
  end

  def move(_map, :left) do
    """
    ####
    #@ #
    ####
    """
  end

  def character_position(
    """
    ####
    #@ #
    ####
    """) do
      {1, 1}
    end

    def chars_with_coords(map) do
      map
      |> String.split("\n")
      |> Enum.map(&Enum.with_index(String.to_charlist(&1)))
      |> Enum.with_index()
      |> Enum.find(fn {line, _} ->
        Enum.find(line, fn
          { 64, _ } -> true
          _ -> false
        end)
      end)
    end

end

