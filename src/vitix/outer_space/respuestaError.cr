class RespuestaError
  property contenido, estado

  def initialize(@contenido : String = "", @estado : Int32 = 503)
  end

  def success?
    false
  end
end
