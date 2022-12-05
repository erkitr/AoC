defmodule Aoc2022 do
  def all do
    day1()
    day2()
    day3()
    day4()
    day5()
  end

  def print_result(day, {time1, answer1},  {time2, answer2}) do
    IO.puts("Day #{day}")
    IO.puts("______")
    IO.puts("Part 1: #{answer1} (#{time1}us)")
    IO.puts("Part 2: #{answer2} (#{time2}us)")
    IO.puts("------\n")
  end

  def day1 do
    part1 = :timer.tc(fn -> Day1.most_calories end)
    part2 = :timer.tc(fn -> Day1.sum_of_top_3 end)
    print_result(1, part1, part2)
  end

  def day2 do
    part1= :timer.tc(fn -> Day2.get_final_score end)
    part2 = :timer.tc(fn -> Day2.get_final_score_2 end)
    print_result(2, part1, part2)
  end


  def day3 do
    part1= :timer.tc(fn -> Day3.answer1 end)
    part2 = :timer.tc(fn -> Day3.answer2 end)
    print_result(3, part1, part2)
  end

  def day4 do
    part1= :timer.tc(fn -> Day4.answer1 end)
    part2 = :timer.tc(fn -> Day4.answer2 end)
    print_result(4, part1, part2)
  end

  def day5 do
    part1= :timer.tc(fn -> Day5.answer1 end)
    part2 = :timer.tc(fn -> Day5.answer2 end)
    print_result(5, part1, part2)
  end
end
