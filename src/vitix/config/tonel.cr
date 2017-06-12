class Tonel
  def initialize(@config : Configuracion, @unInternet : Internet = Internet.new)
  end

  def transformar(url)
    @config.transformar(url).ejecutar @unInternet
  end
end
