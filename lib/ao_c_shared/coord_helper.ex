defmodule AoCShared.CoordHelper do

  def first_in_direction(t, direction_func, give_up_when_func, find_collision_func) do
    loop = &first_in_direction(&1, direction_func, give_up_when_func, find_collision_func)
    slide = direction_func.(t)

    cond do
      give_up_when_func.(slide) -> :found_no_collision
      true ->
        result = find_collision_func.(t)

        if result do
          result
        else
          loop.(slide)
        end
    end
  end
end
