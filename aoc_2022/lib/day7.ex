defmodule Day7 do

  def init() do
    Inputs.for_day(7)
    |> String.split("\n")
    |>Enum.reduce(%{}, fn line, acc ->
      wd = Map.get(acc, "wd", "")
      if String.starts_with?(line, "$") do
        if String.starts_with?(line, "$ cd") do
          dir = String.replace(line, "$ cd ", "")
          cd = if dir == ".." do
            wd |> String.split("/")|> Enum.drop(-1) |> Enum.join("/")
          else
            wd <> "/" <> dir
            |> String.replace("//", "/")
          end
          Map.merge(acc, %{"wd" => cd})
        else
          acc
        end
      else
        path = String.split(wd, "/", trim: true)
        add_into(acc, path, line)
      end
    end)
    |> Map.delete("wd")
  end

  def add_into(dir, path, line) do
    if Enum.count(path) > 0 do
      [head | tail] = path
      sub_dir = Map.get(dir, head)
      Map.merge(dir, %{head => add_into(sub_dir, tail, line)})
    else
      if String.starts_with?(line, "dir") do
        new_dir = String.replace(line, "dir ", "")
        Map.merge(dir, %{new_dir => %{}})
      else
        new_file = String.split(line, " ")
        Map.merge(dir, %{List.last(new_file) => String.to_integer(List.first(new_file))})
      end
    end
  end

  def get_dir_value(dir, val) do
    {size, result}  = dir
    |> Enum.reduce({0,val}, fn {_name, item}, {acc_size, acc_result} ->
      if is_map(item) do
        {item_size, item_result} = get_dir_value(item, acc_result)
        {acc_size + item_size, item_result}
      else
        {acc_size + item, acc_result}
      end
    end)
    unless size > 100000 do
      {size, result + size}
    else
      {size, result}
    end
  end

  def get_dir_size(dir) do
    dir
    |> Enum.reduce(0 , fn {_name, item}, acc ->
      if is_map(item) do
        acc + get_dir_size(item)
      else
        acc + item
      end
    end)
  end

  def find_delete_size(dir, needed_space, val)do
    {size, result}  = dir
    |> Enum.reduce({0,val}, fn {_name, item}, {acc_size, acc_result} ->
      if is_map(item) do
        {item_size, item_result} = find_delete_size(item, needed_space, acc_result)
        {acc_size + item_size, item_result}
      else
        {acc_size + item, acc_result}
      end
    end)
    if size >= needed_space and size < result do
      {size, size}
    else
      {size, result}
    end
  end

  def answer1 do
    {_size, result} = init()
      |> get_dir_value(0)
    result
  end

  def answer2 do
    rootfolder = init()
    used_space = rootfolder
    |> get_dir_size
    unused_space = 70000000 - used_space
    needed_space = 30000000 -unused_space

    {_size, result} = rootfolder
    |> find_delete_size(needed_space, used_space)
    result
  end
end
