class Configuracion
  def initialize
    @reglas = [] of Regla
  end

  def que(cuandoEntroA, vayaA)
    @reglas<< Regla.new(cuandoEntroA, vayaA)
  end

  def transformar(url)
    reglaQueVa = elejirRegla url
    if reglaQueVa.is_a?(Nil)
      AccionDefault.new
    else
      AccionPegarleA.new(reglaQueVa.a url)
    end
  end

  def elejirRegla(url)
    (@reglas.select &.puedoRedireccionar?(url)).shuffle.first?
  end
end
