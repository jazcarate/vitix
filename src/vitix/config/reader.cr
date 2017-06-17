require "yaml"

class ConfigReader
  def self.crear_config(texto)
    config = Configuracion.new
    yaml = YAML.parse(texto)["tonel"]
    puts "Configurando...."
    yaml["reglas"].each do |regla|
      de = regla["desde"].as_s
      a = transformar_a regla["a"]
      puts "Desde #{de}, redirijir a: #{a}"
      config.agregarRegla ReglaFactory.new.de(de).vallaA(a).build
    end
    config.tiempoMuerto = yaml["tiempoMuerto"].as_s.to_i

    config
  end

  def self.transformar_a(a)
    begin
      a.as_a.map &.to_s
    rescue
      a.as_s
    end
  end
end
