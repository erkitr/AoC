defmodule Day6 do

  def init() do
    Inputs.for_day(6)
  end

  def get_marker(signal, length) do
    0..String.length(signal)
    |> Enum.reduce_while(
      {0, false} ,
      fn i, {idx, found} ->
        if !found, do:
        {:cont,
          {
            i+length,
            String.slice(signal, i..i+length-1)
            |> String.to_charlist
            |> Enum.uniq()
            |> Enum.count() == length
          }
        },
      else:
        {:halt, {idx, true} }
      end)
    |> elem(0)
  end


  def answer1 do
    init()
    |> get_marker(4)
  end

  def answer2 do
    init()
    |> get_marker(14)
  end
end
