defmodule AoCShared.CoordHelper do
  alias AoCShared.Coord

  @type t :: Coord.t

  @type found_collision :: any

  @type direction_func :: (t -> t)
  @type give_up_when_func :: (t -> boolean)
  @type find_collision_func :: (t -> found_collision | nil)

  @doc """
  Slide away from a **coord** in given a **direction**

  If a successful **find** occurs before **giving up** (usually by going off edge of a game board), return the result.

  Otherwise, return :found_no_collision

  ## Examples
      iex> first_in_direction(
      ...> {1,1},
      ...> &Coord.right/1,
      ...> &(not Coord.in_range?(&1, 1..99, 1..99)),
      ...> fn coord -> Enum.find([{2,2}, {3,1}, {3,3}, {99,99}], &(&1 == coord)) end
      ...> )
      {3,1}
  """
  @spec first_in_direction(t, direction_func, give_up_when_func, find_collision_func) :: found_collision | :found_no_collision
  def first_in_direction(t, direction_func, give_up_when_func, find_collision_func) do
    loop = &first_in_direction(&1, direction_func, give_up_when_func, find_collision_func)

    slide = direction_func.(t)
    result = find_collision_func.(slide)

    # raise "next, try turning this into With statement?"
    cond do
      give_up_when_func.(slide) -> :found_no_collision
      find_collision_func.(slide) -> result
      true -> loop.(slide)
    end
  end
end
