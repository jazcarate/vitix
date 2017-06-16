require "http/server"
require "./vitix"

config = Configuracion.new

regla = ReglaFactory.new.de("").vallaA(["localhost:4567", "localhost:7654"]).build
config.agregarRegla regla

tonel = Tonel.new config

server = HTTP::Server.new(8080) do |context|
  puts "atendiendo coneccion de #{context.request.resource}"
  respuesta = tonel.transformar context.request.resource
  context.response.print respuesta.contenido
end

puts "escuchando al puerto 8080"
server.listen
