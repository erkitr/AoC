defmodule Day5 do

  def init() do
    Inputs.for_day(5)
    |> String.split("\n\n")
    |> get_start_state
  end


  def get_start_state([crates, instructions]) do
    %{
      'crates' => get_crates(crates),
      'instructions' => get_instructions(instructions)
    }
  end

  def get_instructions(instructions) do
    String.split(instructions, "\n")
    |> Enum.map( fn x ->
        Regex.named_captures(~r/(?<count>\d+) from (?<from>\d+) to (?<to>\d+)/, x)
      end
    )
  end

  def get_crates(crates) do
    String.split(crates, "\n")
    |> Enum.reduce_while(%{}, fn x, result ->
      if String.starts_with?(String.trim(x), "[") ,
      do: {
        :cont,
        1..String.length(x)//4
        |> Enum.with_index
        |> Enum.reduce(result, fn {num, idx}, acc ->
          key = idx+1
          val = Map.get(result, key, [])
          new_item = String.at(x,num)
          if String.match?(new_item, ~r/[[:upper:]]/) do
            Map.merge(acc, %{key => [new_item |val]})
          else
            acc
          end
        end)
      } ,
      else: {:halt, result}
    end)
  end

  def follow_instructions(%{'crates' => crates, 'instructions' => instructions}) do
    instructions
    |> Enum.reduce(crates, fn x,result ->
      make_moves(x,result)
    end)
  end

  def make_moves(instruction, crates) do
    count = String.to_integer(Map.fetch!(instruction, "count"))
    1..count
    |> Enum.reduce(crates, fn _x, result ->
      from_column = instruction
        |> Map.fetch!("from")
        |> String.to_integer()
      from = result
        |> Map.fetch!(from_column)
      to_column = instruction
        |> Map.fetch!("to")
        |> String.to_integer
      to = result
        |> Map.fetch!(to_column)
      {item, from} = List.pop_at(from, -1)
      Map.merge(result, %{from_column => from, to_column => to ++ [item]} )
    end)
  end

  def follow_instructions_9001(%{'crates' => crates, 'instructions' => instructions}) do
    instructions
    |> Enum.reduce(crates, fn x,result ->
      make_moves_9001(x,result)
    end)
  end

  def make_moves_9001(instruction, crates) do
    count = String.to_integer(Map.fetch!(instruction, "count"))
    count..1
    |> Enum.reduce(crates, fn x, result ->
      from_column = instruction
        |> Map.fetch!("from")
        |> String.to_integer()
      from = result
        |> Map.fetch!(from_column)
      to_column = instruction
        |> Map.fetch!("to")
        |> String.to_integer
      to = result
        |> Map.fetch!(to_column)
      {item, from} = List.pop_at(from, 0-x)
      Map.merge(result, %{from_column => from, to_column => to ++ [item]} )
    end)
  end

  def answer1 do
    init()
    |> follow_instructions
    |> Map.values
    |> Enum.reduce("", fn x, acc ->
      acc <> List.last(x)
    end )
  end

  def answer2 do
    init()
    |> follow_instructions_9001
    |> Map.values
    |> Enum.reduce("", fn x, acc ->
      acc <> List.last(x)
    end )
  end
end
