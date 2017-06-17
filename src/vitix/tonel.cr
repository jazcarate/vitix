class Tonel
  def initialize(@config : Configuracion, @unInternet : Internet = Internet.new)
  end

  def transformar(url : String)
    transformar Pedido.new url
  end

  def transformar(pedido : Pedido)
    @config.transformar(@unInternet, pedido)
  end
end
