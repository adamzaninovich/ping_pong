defmodule PingPong.Ping do
  def start() do
    loop(0)
  end

  def loop(number) do
    receive do
      {:pong, from} ->
        number = number + 1
        IO.puts "(#{number}) ping ->"
        :timer.sleep(500)
        send(from, {:ping, self()})
      {:ping, from} ->
        number = number + 2
        IO.puts "         <- pong (#{number})"
        :timer.sleep(500)
        send(from, {:pong, self()})
    end
    loop(number)
  end
end
