defmodule AoCShared.Coord do
  @type t :: {integer(), integer()}

  def up({x,y}), do: {x,y+1}
  def down({x,y}), do: {x,y-1}
  def left({x,y}), do: {x-1,y}
  def right({x,y}), do: {x+1,y}

  def right_up(t), do: t |> right |> up
  def right_down(t), do: t |> right |> down
  def left_down(t), do: t |> left |> down
  def left_up(t), do: t |> left |> up

  def all_adjacent(t) do
    all_adjacent_funcs()
    |> Enum.reduce(MapSet.new, fn slide_direction, coord_set ->
      MapSet.put(coord_set, slide_direction.(t))
    end)
  end


  defp cardinal_funcs, do: [&up/1, &down/1, &left/1, &right/1]
  defp diagonal_funcs, do: [&right_up/1, &right_down/1, &left_down/1, &left_up/1]
  defp all_adjacent_funcs, do: cardinal_funcs() ++ diagonal_funcs()

  # def neighbors(board, target) do
  #   board_coords =
  #     board
  #     |> Enum.map(&elem(&1, 0))
  #     |> MapSet.new

  #   [
  #     target |> up,
  #     target |> down,
  #     target |> left,
  #     target |> right,
  #   ]
  #   |> MapSet.new
  #   |> MapSet.intersection(board_coords)
  # end
end

