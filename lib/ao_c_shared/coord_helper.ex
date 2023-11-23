defmodule AoCShared.CoordHelper do

  def first_in_direction(t, direction_func, give_up_when_func, find_collision_func) do
    loop = &first_in_direction(&1, direction_func, give_up_when_func, find_collision_func)
    slide = direction_func.(t)

    cond do
      give_up_when_func.(slide) -> :found_no_collision
      true ->
        case find_collision_func.(slide) do
          nil -> loop.(slide)
          result -> result
        end
    end
  end
end
