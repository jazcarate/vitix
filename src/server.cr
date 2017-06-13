require "http/server"
require "./vitix"

config = Configuracion.new

regla = ReglaFactory.new.de("/foo").vallaA(["http://google.com", "http://google.com.ar"]).build
config.agregarRegla regla

tonel = Tonel.new config

server = HTTP::Server.new(8080) do |context|
  puts "atendiendo coneccion de #{context.request.path}"
  respuesta = tonel.transformar context.request.path
  context.response.print respuesta.contenido
end

puts "escuchando al puerto 8080"
server.listen
