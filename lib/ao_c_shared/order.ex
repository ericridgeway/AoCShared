defmodule AoCShared.Order do
  @moduledoc """
  Functions for putting collections in various orders

  In this module:
    - Lists are used for *ordered* collections
      - Think all possible shuffled orders for a deck of cards

    - Sets are used for *unordered* collections
      - Think "the unique combination of a & b"
      - Order doesn't matter
      - So if [a,b] is included, [b,a] wont be

  Duplicates aren't allowed for either (although Sets is the only one to actually enforce that)
  """

  @type set :: MapSet.t(any)
  @type set_of_lists :: MapSet.t(list(any()))
  @type set_of_sets :: MapSet.t(set)


  @doc """
  Return all possible orders (aka permutations) of a size n collection

  - Returned Outer collection will be size: factorial(n)
  - Each inner ordering will be size: n

  ## Examples
      iex> set_of_3 = MapSet.new(~w(a b c))

      iex> all_lists(set_of_3)
      MapSet.new([
        ~w(a b c),
        ~w(a c b),

        ~w(b a c),
        ~w(b c a),

        ~w(c a b),
        ~w(c b a),
      ])
  """
  @spec all_lists(set) :: set_of_lists
  def all_lists(set) do
    set
    |> MapSet.to_list
    |> permutations
    |> MapSet.new
  end

  @doc """
  From collection of n items, return all unique combinations of size k (aka "n choose k" or "combinations")

  - Calculation for Returned Outer collection size:
    - https://www.statlect.com/glossary/binomial-coefficient

  - Each inner ordering will be size: k

  ## Examples
      iex> set_of_3 = MapSet.new(~w(a b c))

      iex> all_sub_sets(set_of_3, 2)
      MapSet.new([
        MapSet.new(~w(a b)),
        MapSet.new(~w(a c)),
        MapSet.new(~w(b c)),
      ])
  """
  @spec all_sub_sets(set, integer()) :: set_of_sets
  def all_sub_sets(set, sub_set_size) do
    set
    |> MapSet.to_list
    |> then(&combination(sub_set_size, &1))
    |> Enum.map(&MapSet.new/1)
    |> MapSet.new
  end

  @doc """
  For each combination (size n) from an outer collection size k, return all possible orders of the inner combination

  This is the same as doing all_sub_sets/2 then flat mapping them using all_lists

  Notes:
    - I'm not sure of the calculation for size
    - I'm not positive we'll need this function

  ## Examples
      iex> set_of_3 = MapSet.new(~w(a b c))

      iex> all_sub_lists(set_of_3, 2)
      MapSet.new([
        ~w(a b),
        ~w(b a),

        ~w(a c),
        ~w(c a),

        ~w(b c),
        ~w(c a),
      ])
  """
  @spec all_sub_lists(set, integer()) :: set_of_lists
  def all_sub_lists(set, sub_set_size) do
    all_sub_sets(set, sub_set_size)
    |> Enum.flat_map(&all_lists/1)
    |> MapSet.new
  end


  # Source:
  #   https://elixirforum.com/t/most-elegant-way-to-generate-all-permutations/2706/2
  defp permutations([]), do: [[]]
  defp permutations(list) do
    for elem <- list,
        rest <- permutations(list--[elem]) do
      [elem|rest]
    end
  end

  # Source:
  #   https://stackoverflow.com/a/30587756/1421642
  defp combination(0, _), do: [[]]
  defp combination(_, []), do: []
  defp combination(n, [x|xs]) do
    (for y <- combination(n - 1, xs), do: [x|y]) ++ combination(n, xs)
  end
end
