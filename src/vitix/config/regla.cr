class Regla
  def initialize(@de : String, @a : String)
  end

  def puedoRedireccionar?(url)
    url.starts_with? @de
  end

  def a(url)
    url.sub(@de, @a)
  end
end
