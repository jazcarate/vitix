require "http/server"
require "./vitix"

config = ConfigReader.crear_config(File.read "./config.yaml")
tonel = Tonel.new config

server = HTTP::Server.new(8080) do |context|
  puts "atendiendo coneccion de [#{context.request.method}]#{context.request.resource}"
  respuesta = tonel.transformar Pedido.new context.request.resource, context.request.method, context.request.body
  context.response.print respuesta.contenido
end

puts "escuchando al puerto 8080"
server.listen
