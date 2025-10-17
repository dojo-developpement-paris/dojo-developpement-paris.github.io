defmodule Fizzbuzz do
  @moduledoc """
  Documentation for `Fizzbuzz`.
  """

  def fizzbuzz(n) do
    Stream.zip_with(
      [
        1..n,
        Stream.cycle([nil, nil, "fizz"]),
        Stream.cycle([nil, nil, nil, nil, "buzz"])
      ],
      fn [number, fizz, buzz] ->
        case {fizz, buzz} do
          {nil, nil} ->
            "#{number}"

          {fizz, nil} ->
            fizz

          {nil, buzz} ->
            buzz

          {fizz, buzz} ->
            fizz <> buzz
        end
      end
    )
    |> Enum.to_list()
  end
end
