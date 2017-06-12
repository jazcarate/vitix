require "http/server"
require "./vitix"

config = Configuracion.new
config.que cuandoEntroA: "/foo", vayaA: "http://google.com"

tonel = Tonel.new config

server = HTTP::Server.new(8080) do |context|
  sleep 0.5
  respuesta = tonel.transformar context.request.path
  context.response.print respuesta.contenido
end

puts "escuchando al puerto 8080"
server.listen
