defmodule Day1 do

  def sum_of_top_3 do
    get_top_3()
    |>Enum.sum()
  end

  def get_top_3 do
    get_elves_with_calorie_sum()
    |> Enum.sort()
    |> Enum.take(-3)
  end

  def most_calories do
    get_elves_with_calorie_sum()
    |> Enum.max()
  end

  def get_elves_with_calorie_sum do
    get_elves()
    |> Enum.map(fn x -> get_calorie_sum(x) end)
  end

  def get_elves do
    Inputs.day1()
    |> String.split("\n\n")
  end

  def get_foods(elve) do
    elve
    |> String.split("\n")
    |> Enum.map(fn x -> String.trim(x) end)
  end

  def get_calories(elve) do
    get_foods(elve)
    |> Enum.map(fn x -> String.to_integer(x) end)
  end

  def get_calorie_sum(elve) do
    get_calories(elve)
    |> Enum.sum()
  end
end
