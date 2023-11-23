defmodule AoCShared.CoordHelper do
  alias AoCShared.Coord

  @type t :: Coord.t

  @type found_collision :: any

  @type direction_func :: (t -> t)
  @type give_up_when_func :: (t -> boolean)
  @type find_collision_func :: (t -> found_collision | nil)

  @spec first_in_direction(t, direction_func, give_up_when_func, find_collision_func) :: found_collision | :found_no_collision
  def first_in_direction(t, direction_func, give_up_when_func, find_collision_func) do
    loop = &first_in_direction(&1, direction_func, give_up_when_func, find_collision_func)

    slide = direction_func.(t)
    result = find_collision_func.(slide)

    cond do
      give_up_when_func.(slide) -> :found_no_collision
      find_collision_func.(slide) -> result
      true -> loop.(slide)
    end
  end
end
