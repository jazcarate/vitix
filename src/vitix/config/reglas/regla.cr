class Regla
  def initialize(@de : String, @a : MultiplesServidores | UnServidor)
  end

  def puedoRedireccionar?(url)
    url.empieza_con? @de
  end

  def a(internet, url)
    @a.request(internet, url.sacar @de)
  end
end
