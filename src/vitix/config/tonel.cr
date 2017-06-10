class Tonel
  def initialize(configuracion : Configuracion)
    @config = configuracion
  end

  def transformar(url)
    @config.transformar(url).ejecutar
  end
end
