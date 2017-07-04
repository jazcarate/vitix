class Respuesta
  property contenido, estado

  def initialize(@contenido : String, @estado : Int32)
  end

  def success?
    true
  end
end
