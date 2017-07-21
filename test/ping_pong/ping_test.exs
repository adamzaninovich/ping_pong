defmodule PingPong.PingTest do
  use ExUnit.Case

  alias PingPong.Ping

  test "it responds to a pong with a ping" do
    ping = spawn(Ping, :start, [])

    send(ping, {:pong, self()})
    assert_receive {:ping, ^ping}

    send(ping, {:pong, self()})
    assert_receive {:ping, ^ping}
  end
end
