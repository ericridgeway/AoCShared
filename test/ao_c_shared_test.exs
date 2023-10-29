defmodule AoCSharedTest do
  use ExUnit.Case
  doctest AoCShared

  test "greets the world" do
    assert AoCShared.hello() == :world
  end
end
