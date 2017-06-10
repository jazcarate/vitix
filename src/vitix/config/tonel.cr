class Tonel
  def initialize(@config : Configuracion, @unInternet : Internet)
  end

  def transformar(url)
    @config.transformar(url).ejecutar @unInternet
  end
end
