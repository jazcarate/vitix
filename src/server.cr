require "http/server"
require "./vitix"

config_path = ARGV.size == 0 ? "./config.yaml" : ARGV[0]

config = ConfigReader.crear_config(File.read config_path)
tonel = Tonel.new config

server = HTTP::Server.new(8080) do |context|
  puts "atendiendo coneccion de [#{context.request.method}]#{context.request.resource}"
  respuesta = tonel.transformar Pedido.new context.request.resource, context.request.method, context.request.body
  context.response.status_code = respuesta.estado
  context.response.print respuesta.contenido
end

puts "escuchando al puerto 8080"
server.listen
