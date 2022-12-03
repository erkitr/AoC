defmodule Aoc2022 do
  def all do
    day1()
    day2()
  end

  def day1 do
    IO.puts("Day 1")
    IO.puts("______")
    IO.puts("Part 1: #{Day1.most_calories}")
    IO.puts("Part 2: #{Day1.sum_of_top_3}")
    IO.puts("------\n")
  end

  def day2 do
    IO.puts("Day 2")
    IO.puts("______")
    IO.puts("Part 1: #{Day2.get_final_score}")
    IO.puts("Part 2: #{Day2.get_final_score_2}")
    IO.puts("------\n")
  end
end
