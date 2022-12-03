defmodule Inputs do
  def for_day(day) do
    {:ok, body} = File.read("input/day#{day}.input")
    body
  end
end
