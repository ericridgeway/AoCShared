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

  @doc """
  Check if a coord is in range, such as being on the grid of a game board

  Given ranges are inclusive

  ## Examples
      iex> Coord.in_range?({2,2}, 1..10, 1..2))
      true

      iex> Coord.in_range?({99,99}, 1..10, 1..2))
      false
  """
  @spec in_range?(t, Range.t, Range.t) :: boolean
  def in_range?({x,y}=_t, x_range, y_range), do: x in x_range and y in y_range

  def cardinal_funcs, do: [&up/1, &down/1, &left/1, &right/1]
  def diagonal_funcs, do: [&right_up/1, &right_down/1, &left_down/1, &left_up/1]
  def all_adjacent_funcs, do: cardinal_funcs() ++ diagonal_funcs()


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

