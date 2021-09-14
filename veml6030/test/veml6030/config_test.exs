defmodule VEML6030.ConfigTest do
  use ExUnit.Case, async: true

  test "it provides a sensisble default confing" do
    assert VEML6030.Config.new() == %VEML6030.Config{gain: :gain_1_4th, int_time: :it_100_ms, interrupt: false, shutdown: false}
  end

  test "it can be configured with options" do
    config = VEML6030.Config.new([gain: :gain_1_8th, int_time: :it_800_ms, interrupt: true])
    assert config == %VEML6030.Config{gain: :gain_1_8th, int_time: :it_800_ms, interrupt: true, shutdown: false}
  end

  test "it coverts the config into a 16 bit integer" do
    integer =
      VEML6030.Config.new()
      |> VEML6030.Config.to_integer()

    assert integer == 6144
  end
end
