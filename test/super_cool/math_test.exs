defmodule SuperCool.MathTest do
  use ExUnit.Case

  alias SuperCool.Math

  describe "add/2" do
    test "success: can add two numbers" do
      assert Math.add(1, 2) == 3
    end
  end

  describe "subtract/2" do

    @tag :skip
    test "success: can subtract two numbers" do
      assert Math.subtract(2, 1) == 4
    end
  end
end
