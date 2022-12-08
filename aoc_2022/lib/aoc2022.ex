defmodule Aoc2022 do
  def all do
    day1(true)
    day2(true)
    day3(true)
    day4(true)
    day5(true)
    day6(true)
    day7(true)
  end

  def times do
    day1(false)
    day2(false)
    day3(false)
    day4(false)
    day5(false)
    day6(false)
    day7(false)
  end

  def print_result(day, part1,  part2, include_answers) do
    IO.puts("Day #{day}")
    IO.puts("______")
    print_part(1, part1, include_answers)
    print_part(2, part2, include_answers)
    IO.puts("------\n")
  end

  def print_part(num, {time, answer}, include_answers) do
    if include_answers do
      IO.puts("Part #{num}: #{answer} TIME: #{time} microseconds")
    else
      IO.puts("Part #{num}: TIME: #{time} microseconds")
    end
  end

  def day1(include_answers) do
    part1 = :timer.tc(fn -> Day1.most_calories end)
    part2 = :timer.tc(fn -> Day1.sum_of_top_3 end)
    print_result(1, part1, part2, include_answers)
  end

  def day2(include_answers) do
    part1= :timer.tc(fn -> Day2.get_final_score end)
    part2 = :timer.tc(fn -> Day2.get_final_score_2 end)
    print_result(2, part1, part2, include_answers)
  end


  def day3(include_answers) do
    part1= :timer.tc(fn -> Day3.answer1 end)
    part2 = :timer.tc(fn -> Day3.answer2 end)
    print_result(3, part1, part2, include_answers)
  end

  def day4(include_answers) do
    part1= :timer.tc(fn -> Day4.answer1 end)
    part2 = :timer.tc(fn -> Day4.answer2 end)
    print_result(4, part1, part2, include_answers)
  end

  def day5(include_answers) do
    part1= :timer.tc(fn -> Day5.answer1 end)
    part2 = :timer.tc(fn -> Day5.answer2 end)
    print_result(5, part1, part2, include_answers)
  end

  def day6(include_answers) do
    part1= :timer.tc(fn -> Day6.answer1 end)
    part2 = :timer.tc(fn -> Day6.answer2 end)
    print_result(6, part1, part2, include_answers)
  end

  def day7(include_answers) do
    part1= :timer.tc(fn -> Day7.answer1 end)
    part2 = :timer.tc(fn -> Day7.answer2 end)
    print_result(7, part1, part2, include_answers)
  end
end
