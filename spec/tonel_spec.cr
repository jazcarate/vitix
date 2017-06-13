require "./spec_helper"

describe Tonel do
  describe "#transform/1" do
    context "cuando no configuras nada" do
      it "deberia responder un error 404 si enctro a cualqueir lado" do
        respuesta = Tonel.new(Configuracion.new, InternetDeMentira.new).transformar("/CualquierCosa")

        respuesta.estado.should eq 404
        respuesta.contenido.should contain "No existe Regla"
      end
    end

    context "cuando configuro que `/foo` sea `miGoogle`" do
      it "deberia responderme con estado 200 y el contenido de miGoogle" do
        configuracion = Configuracion.new
        regla = ReglaFactory.new.de("/foo").vallaA("miGoogle").build
        configuracion.agregarRegla regla

        internet = InternetDeMentira.new({
          "miGoogle" => "<h1>Hola! soy TuGoogle</h1>",
        })

        respuesta= Tonel.new(configuracion, internet).transformar("/foo")
        respuesta.estado.should eq 200
        respuesta.contenido.should eq "<h1>Hola! soy TuGoogle</h1>"
      end
      it "deberia respetar los query params" do
        configuracion = Configuracion.new
        regla = ReglaFactory.new.de("/foo").vallaA("miGoogle").build
        configuracion.agregarRegla regla

        internet = InternetDeMentira.new({
          "miGoogle" => "<h1>Hola! soy TuGoogle</h1>",
          "miGoogle?hola=yes" => "<h1>Holitas!</h1>",
        })

        respuesta= Tonel.new(configuracion, internet).transformar("/foo?hola=yes")
        respuesta.contenido.should eq "<h1>Holitas!</h1>"
      end
    end
    context "cuando configuro que `/bar` sea `miGoogle`" do
      it "deberia responderme con estado 200 y el contenido de miGoogle" do
        configuracion = Configuracion.new
        regla = ReglaFactory.new.de("/bar").vallaA("miGoogle").build
        configuracion.agregarRegla regla

        internet = InternetDeMentira.new({
          "miGoogle" => "<h1>Hola! soy TuGoogle</h1>",
        })

        respuesta= Tonel.new(configuracion, internet).transformar("/bar")
        respuesta.estado.should eq 200
        respuesta.contenido.should eq "<h1>Hola! soy TuGoogle</h1>"
      end
    end
    context "cuando configuro que `/foo` sea `otroLado`" do
      it "deberia responderme con estado 200 y el contenido de otroLado" do
        configuracion = Configuracion.new
        regla = ReglaFactory.new.de("/foo").vallaA("otroLado").build
        configuracion.agregarRegla regla

        internet = InternetDeMentira.new({
          "otroLado" => "<h1>Hola! soy otro lado</h1>",
        })

        respuesta= Tonel.new(configuracion, internet).transformar("/foo")
        respuesta.estado.should eq 200
        respuesta.contenido.should eq "<h1>Hola! soy otro lado</h1>"
      end
      it "deberia conservar los query params" do
        configuracion = Configuracion.new
        regla = ReglaFactory.new.de("/foo").vallaA("otroLado").build
        configuracion.agregarRegla regla

        internet = InternetDeMentira.new({
          "otroLado" => "<h1>Hola! soy otro lado</h1>",
          "otroLado?con=quey&params" => "<h1>Hola! tengo query params!</h1>",
        })

        respuesta= Tonel.new(configuracion, internet).transformar("/foo?con=quey&params")
        respuesta.estado.should eq 200
        respuesta.contenido.should eq "<h1>Hola! tengo query params!</h1>"
      end

      context "pero `otroLado` devuelve un 404" do
        it "deberia responderme un error" do
          configuracion = Configuracion.new
          regla = ReglaFactory.new.de("/foo").vallaA("otroLado").build
          configuracion.agregarRegla regla

          internet = InternetDeMentira.new()

          respuesta= Tonel.new(configuracion, internet).transformar("/foo")
          respuesta.estado.should eq 404
        end
      end
    end
    context "cuando hay dos reglas de una URL a dos servidores, uno que anda y uno que no" do
      it "deberia responder un error 200 todas las veces" do
        configuracion = Configuracion.new
        regla = ReglaFactory.new.de("/foo").vallaA(["anda", "noAnda"]).build
        configuracion.agregarRegla regla

        internet = InternetDeMentira.new({
          "anda" => "<h1>I'm alive</h1>",
        })

        tonel = Tonel.new(configuracion, internet)

        respuesta=tonel.transformar("/foo")
        respuesta.estado.should eq 200

        respuesta=tonel.transformar("/foo")
        respuesta.estado.should eq 200

        respuesta=tonel.transformar("/foo")
        respuesta.estado.should eq 200
      end
    end

  end
end
