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
    return HTTP::Client::Response.new(200, @directorio[url]) if @directorio[url]?
    HTTP::Client::Response.new(404, status_message: "no existe!")
  end
end
