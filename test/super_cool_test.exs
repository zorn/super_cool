defmodule SuperCoolTest do
  use ExUnit.Case
  doctest SuperCool

  test "greets the world" do
    assert SuperCool.hello() == :world
  end
end
