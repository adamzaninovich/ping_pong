# PingPong

## Usage:

```
iex> alias PingPong.Ping
PingPong.Ping
iex> ping = spawn(Ping, :start, [])
#PID<0.134.0>
iex> pong = spawn(Ping, :start, [])
#PID<0.136.0>
iex> send(ping, {:pong, pong})
{:pong, #PID<0.136.0>}
(1) ping ->
         <- pong (2)
(2) ping ->
         <- pong (4)
...
```
