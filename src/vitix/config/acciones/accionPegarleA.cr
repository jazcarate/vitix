class AccionPegarleA
  def initialize(@url : String)
  end

  def ejecutar(internet)
    contenido = internet.get(@url)
    RespuestaCorrecta.new(contenido)
  end
end
