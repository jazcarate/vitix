class UnServidor
  getter vivo
  def initialize(@host : String)
    @vivo = true
  end

  def request(internet, endpoint)
    respuesta = internet.get(@host + endpoint)
    if respuesta.success?
      Respuesta.new(respuesta.body, respuesta.status_code)
    else
      puts "Status: #{respuesta.status_code}, mensaje: #{respuesta.status_message}"
      matar
      RespuestaError.new
    end
  end

  def matar
    puts "matando al server #{@host}"
    @vivo = false
  end
end
