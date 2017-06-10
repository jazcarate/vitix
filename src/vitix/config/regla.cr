class Regla
  def initialize(@de : String, @a : String)
  end

  def puedoRedireccionar?(url)
    @de == url
  end

  def a
    @a
  end
end
