class MultiplesServidores
  def initialize(@servidores : Array(UnServidor))
  end

  def request(internet, endpoint)
    intentar = RespuestaError.new("No existe server")
    servidoresVivos.each { |servidor|
      intentar = servidor.request(internet, endpoint)
      break unless intentar.is_a? RespuestaError
    }
    return intentar
  end

  private def servidoresVivos
    @servidores.select(&.vivo?).shuffle!
  end
end
