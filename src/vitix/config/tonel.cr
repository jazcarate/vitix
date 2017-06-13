class Tonel
  def initialize(@config : Configuracion, @unInternet : Internet = Internet.new)
  end

  def transformar(url)
    @config.transformar(@unInternet, url)
  end
end
