class ReglaFactory
  def vallaA(host : String)
    @serverFact = FactoryUnServer.new host
    self
  end

  def vallaA(hosts : Array(String))
    @serverFact = FactoryMultiplesServers.new hosts
    self
  end

  def de(de : String)
    @de = de
    self
  end

  def build()
    serverFact = @serverFact
    de = @de
    if !serverFact.nil? && !de.nil?
      Regla.new de, serverFact.build
    else
      raise "AAAAH"
    end
  end
end

private class FactoryMultiplesServers
  def initialize(@urls : Array(String))
  end

  def build
    MultiplesServidores.new (@urls.map { |url| FactoryUnServer.new url }).map &.build
  end
end

private class FactoryUnServer
  def initialize(@url : String)
  end

  def build
    UnServidor.new @url
  end
end
