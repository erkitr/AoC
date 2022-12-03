defmodule Day2 do

  def get_final_score() do
    Enum.sum(get_round_scores())
  end

  def get_final_score_2() do
    Enum.sum(get_round_scores_2())
  end

  def get_round_scores() do
    get_rounds()
    |> Enum.map(fn x -> selection_to_choice(x) end)
    |> Enum.map(fn x -> calculate_score(x) end)
  end

  def get_round_scores_2() do
    get_rounds()
    |> Enum.map(fn x -> selection_to_choice_2(x) end)
    |> Enum.map(fn x -> calculate_score(x) end)
  end

  def selection_to_choice(%{"p1" => p1, "p2" => p2} ) do
    %{"p1" => get_p1_choice(p1), "p2" => get_p2_choice(p2)}
  end

  def selection_to_choice_2(%{"p1" => p1, "p2" => p2} ) do
    p1_choice = get_p1_choice(p1)
    %{"p1" => p1_choice, "p2" => get_p2_choice(p1_choice, p2)}
  end

  def calculate_score(%{"p1" => p1, "p2" => p2}) do
    get_choice_points(p2) + get_result_points(p1, p2)
  end

  def get_choice_points(choice) do
    case choice do
      :rock -> 1
      :paper -> 2
      :scissors -> 3
    end
  end

  def get_result_points(p1, p2) when p1 == p2 do
    3
  end

  def get_result_points(p1, p2) when p1 != p2 do
    if is_victory(p1, p2) do
      6
    else
      0
    end
  end

  def is_victory(p1, :rock) do
    p1 == :scissors
  end

  def is_victory(p1, :paper) do
    p1 == :rock
  end

  def is_victory(p1, :scissors) do
    p1 == :paper
  end

  def get_rounds() do
    Inputs.day2()
    |> String.split("\n")
    |> Enum.map(fn x -> get_round_selections(x) end)
  end

  def get_round_selections(round) do
    Regex.named_captures(~r/(?<p1>[ABC]) (?<p2>[XYZ])/, round)
  end



  def get_p1_choice(value) do
    case value do
      "A" -> :rock
      "B" -> :paper
      "C" -> :scissors
    end
  end

  def get_p2_choice(value) do
    case value do
      "X" -> :rock
      "Y" -> :paper
      "Z" -> :scissors
    end
  end

  def get_p2_choice(p1, value) do
    case value do
      "X" -> get_loser_against(p1)
      "Y" -> p1
      "Z" -> get_winner_against(p1)
    end
  end

  def get_loser_against(:rock) do
    :scissors
  end

  def get_loser_against(:paper) do
    :rock
  end

  def get_loser_against(:scissors) do
    :paper
  end


  def get_winner_against(:rock) do
    :paper
  end

  def get_winner_against(:paper) do
    :scissors
  end

  def get_winner_against(:scissors) do
    :rock
  end

end
