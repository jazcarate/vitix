class Regla
  def initialize(@de : String, @a : MultiplesServidores | UnServidor)
  end

  def puedoRedireccionar?(url)
    url.starts_with? @de
  end

  def a(internet, url)
    @a.request(internet, url.lchop @de)
  end
end
