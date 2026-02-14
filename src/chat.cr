require "kemal"
require "json"
require "atomic"

PORTA = 9090
CONT = Atomic(Int32).new(0)

class Client
  property username : String
  property ws : HTTP::WebSocket

  def initialize(@ws, @username)
  end

  def send(message, username)
    ws.send({message: message, username: username}.to_json)
  end
end

clients = [] of Client

ws "/chat" do |socket|
  id = CONT.add(1)
  username = "username-#{id}"
  puts "[log] Nova conexão #{username}"

  client = Client.new(socket, username)
  clients << client

  socket.on_message do |message|
    clients.each do |c|
      c.send(message, username)
    end
  end

  socket.on_close do
    clients.delete(client)
    puts "[log] #{username} desconectado"
  end
end

get "/" do |env|
  render "src/public/index.ecr"
end

Kemal.run(PORTA)
