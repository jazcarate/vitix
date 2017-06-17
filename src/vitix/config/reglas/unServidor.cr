class UnServidor
  def initialize(@host : String)
    @vivo = true
    @cuandoMurio = Time.new(0)
  end

  def request(internet, endpoint)
    respuesta = internet.do(@host, endpoint)
    if respuesta.success?
      Respuesta.new(respuesta.body, respuesta.status_code)
    else
      puts "Status: #{respuesta.status_code}, mensaje: #{respuesta.status_message}"
      matar
      RespuestaError.new
    end
  end

  def matar
    puts "matando al server #{@host}"
    @vivo = false
    @cuandoMurio = Time.now
  end

  def vivo?
    chekear_cuando_murio
    @vivo
  end

  private def chekear_cuando_murio
    if !@vivo && @cuandoMurio < Time.now + Time::Span.new 0, 0, 10
      puts "reviviendo #{@host}!"
      @vivo = true
    end
  end
end
