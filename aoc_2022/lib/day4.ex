defmodule Day4 do

  def get_pairs() do
    Inputs.for_day(4)
    |> String.split("\n")
    |> Enum.map(
      &String.trim(&1)
      |> String.split(",")
      |> get_pair_ranges
    )
  end


  def get_pair_ranges([elf1, elf2]) do
    [get_range(elf1), get_range(elf2)]
  end

  def get_range(x) do
    %{"a" => a, "b" => b} = Regex.named_captures(~r/(?<a>\d+)-(?<b>\d+)/, x)
    String.to_integer(a, 10)..String.to_integer(b, 10)
  end

  def ranges_fully_contain([elf1, elf2]) do
    ((elf1.first >= elf2.first and elf1.last <= elf2.last) or
    (elf2.first >= elf1.first and elf2.last <= elf1.last))
  end

  def ranges_overlap([elf1, elf2]) do
    !Range.disjoint?(elf1, elf2)
  end

  def ranges_overlap2([elf1, elf2]) do
    ((elf1.last >= elf2.first and elf1.first <= elf2.last) or
    (elf2.last >= elf1.first and elf2.first <= elf1.last))
  end

  def answer1() do
    get_pairs()
    |> Enum.count(&ranges_fully_contain(&1))
  end

  def answer2() do
    get_pairs()
    |> Enum.count(&ranges_overlap2(&1))
  end
end
