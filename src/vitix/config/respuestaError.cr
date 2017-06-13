class RespuestaError
  property contenido, estado

  def initialize(@contenido : String = "", @estado : Int32 = 404)
  end
end
