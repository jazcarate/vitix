class Configuracion
  def initialize
    @reglas = [] of Regla
  end

  def que(cuandoEntroA, vayaA)
      @reglas<< Regla.new(cuandoEntroA, vayaA)
  end

  def transformar(url)
    reglaQueVa = @reglas.find &.puedoRedireccionar?(url)
    if reglaQueVa.is_a?(Nil)
      AccionError.new
    else
      AccionPegarleA.new(reglaQueVa.a)
    end
  end
end
