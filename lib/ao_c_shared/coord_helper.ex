defmodule AoCShared.CoordHelper do

  def first_in_direction(t, direction_func, give_up_when_func, find_collision_func) do
    loop = &first_in_direction(&1, direction_func, give_up_when_func, find_collision_func)
    slide = direction_func.(t)
    result = find_collision_func.(slide)

    cond do
      give_up_when_func.(slide) -> :found_no_collision
      result -> result
      true -> loop.(slide)
    end
  end
end
