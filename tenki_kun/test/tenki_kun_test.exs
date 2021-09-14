defmodule TenkiKunTest do
  use ExUnit.Case
  doctest TenkiKun

  test "greets the world" do
    assert TenkiKun.hello() == :world
  end
end
