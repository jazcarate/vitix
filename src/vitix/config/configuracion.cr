class Configuracion
  def initialize
    @reglas = [] of Regla
  end

  def que(cuandoEntroA, vayaA, conProbabilidad = nil)
    i=0
    iteraciones = conProbabilidad ? conProbabilidad : 100- @reglas.size
    while i < iteraciones
      @reglas<< Regla.new(cuandoEntroA, vayaA)
      i+=1
    end
  end

  def transformar(url)
    reglaQueVa = elejirRegla url
    if reglaQueVa.is_a?(Nil)
      AccionDefault.new
    else
      AccionPegarleA.new(reglaQueVa.a)
    end
  end

  def elejirRegla(url)
    (@reglas.select &.puedoRedireccionar?(url)).shuffle.first?
  end
end
