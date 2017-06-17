class Pedido
  getter url, cuerpo, metodo
  def initialize(@url : String, @metodo : String = "GET", @cuerpo : IO? = nil,)
  end

  def empieza_con?(que)
    url.starts_with? que
  end

  def sacar(que)
    Pedido.new url.lchop(que), @metodo
  end

  def con_host(host)
    host + url
  end

  def get?
    @metodo == "GET"
  end

  def post?
    @metodo == "POST"
  end

  def put?
    @metodo == "PUT"
  end

  def reintentar?
    !get?
  end
end
