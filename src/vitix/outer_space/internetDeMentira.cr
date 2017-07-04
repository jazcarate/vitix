class InternetDeMentira < Internet
  def initialize(@directorio : Hash(String, String) = {} of String => String )
  end

  def desconectar(servidor)
    @directorio.reject! servidor
  end

  def do(host, pedido)
    get(pedido.con_host host)
  end

  def get(url)
    return Respuesta.new(@directorio[url], 200) if @directorio[url]?
    RespuestaError.new("no existe!", 503)
  end
end
