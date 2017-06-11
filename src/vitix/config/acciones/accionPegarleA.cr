class AccionPegarleA
  def initialize(@url : String)
  end

  def ejecutar(internet)
    respuesta = internet.get(@url)
    if respuesta.success?
      Respuesta.new(respuesta.body, respuesta.status_code)
    else
      Respuesta.new(respuesta.status_message, respuesta.status_code)
    end
  end

  def ==(otraAccion : AccionPegarleA)
    @url == otraAccion.@url
  end
end
