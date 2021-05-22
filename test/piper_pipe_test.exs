defmodule PiperPipeTest do
  use ExUnit.Case
  doctest PiperPipe

  test "greets the world" do
    assert PiperPipe.hello() == :world
  end
end
