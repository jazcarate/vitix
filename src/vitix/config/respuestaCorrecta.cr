class RespuestaCorrecta
  def initialize(@contenido : String)
  end
  
  def contenido
    @contenido
  end

  def estado
    200
  end
end
