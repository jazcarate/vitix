class Configuracion
  getter reglas
  def initialize(@rand : Random = Random::DEFAULT)
    @reglas = [] of Regla
  end

  def agregarRegla(regla)
    @reglas<< regla
  end

  def tiempoMuerto=(unTiempo)
    UnServidor.tiempoMuerto=unTiempo
  end

  def transformar(internet, url)
    reglaQueVa = elejirRegla url
    reglaQueVa.a internet, url
  end

  def elejirRegla(url)
    @reglas.find(if_none: ReglaNoExiste.new) { |regla| regla.puedoRedireccionar?(url) }
  end
end
