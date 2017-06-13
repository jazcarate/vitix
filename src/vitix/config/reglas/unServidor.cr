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
      matar
      RespuestaError.new
    end
  end

  def matar
    @vivo = false
  end
end
