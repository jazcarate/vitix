class UnServidor
  @@tiempoMuerto=Time::Span.new Time::Span::TicksPerHour

  def initialize(@host : String)
    @vivo = true
    @cuandoMurio = Time.new(0)
  end

  def self.tiempoMuerto=(unTiempo)
    @@tiempoMuerto = Time::Span.new unTiempo*Time::Span::TicksPerSecond
  end

  def request(internet, endpoint)
    respuesta = internet.do(@host, endpoint)
    if !respuesta.success?
      matar
    end
    respuesta
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
    if !@vivo && @cuandoMurio + @@tiempoMuerto < Time.now
      puts "reviviendo #{@host}?"
      @vivo = true
    end
  end
end
