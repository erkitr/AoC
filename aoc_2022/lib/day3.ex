defmodule Day3 do

  def get_rucksacks() do
    Inputs.for_day(3)
    |> String.split("\n")
    |> Enum.map(fn x -> String.trim(x) end)
  end

  def get_compartments(sack) do
    len = String.length(sack)
    %{
      'c1' => String.slice(sack, 0..div(len,2)-1),
      'c2' => String.slice(sack, div(len,2)..len)
    }
  end

  def get_common(%{ 'c1' => c1, 'c2' => c2 }) do
    get_common(c1,c2)
    |> List.first
  end

  def get_common(item1, item2) do
      MapSet.intersection(
        MapSet.new(String.to_charlist(item1)),
        MapSet.new(String.to_charlist(item2))
      )
      |> MapSet.to_list
  end


  def rucksacks_common() do
    get_rucksacks()
    |> Enum.map(fn x -> get_compartments(x) end)
    |> Enum.map(fn x -> get_common(x) end)
  end

  def get_priority(type) when type < 97 do
    type - 38
  end

  def get_priority(type) when type > 96 do
    type - 96
  end

  def rucksack_priorities() do
    rucksacks_common()
    |> Enum.map(fn x -> get_priority(x) end)
  end

  def answer1() do
    rucksack_priorities()
    |> Enum.sum()
  end

  def get_groups() do
    get_rucksacks()
    |> Enum.chunk_every(3)
  end

  def get_group_common([s1, s2, s3]) do
    commons = List.to_string(get_common(s1,s2))
    get_common(commons,s3)
    |> List.first
  end

  def get_group_commons() do
    get_groups()
    |> Enum.map(fn x -> get_group_common(x) end)
  end

  def answer2() do
    get_group_commons()
    |> Enum.map(fn x -> get_priority(x) end)
    |> Enum.sum()
  end
end
