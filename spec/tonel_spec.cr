require "./spec_helper"

describe Tonel do
  describe "#transform/1" do
    context "cuando no configuras nada" do
      it "deberia responder un error 404 si enctro a cualqueir lado" do
        respuesta = Tonel.new(Configuracion.new, InternetDeMentira.new).transformar("/CualquierCosa")

        respuesta.estado.should eq 404
        respuesta.contenido.should contain "No había ninguna regla!"
      end
    end

    context "cuando configuro que `/foo` sea `miGoogle`" do
      it "deberia responderme con estado 200 y el contenido de miGoogle" do
        configuracion = Configuracion.new
        configuracion.que cuandoEntroA: "/foo", vayaA: "miGoogle"

        internet = InternetDeMentira.new({
          "miGoogle" => "<h1>Hola! soy TuGoogle</h1>",
        })

        respuesta= Tonel.new(configuracion, internet).transformar("/foo")
        respuesta.estado.should eq 200
        respuesta.contenido.should eq "<h1>Hola! soy TuGoogle</h1>"
      end
      it "deberia respetar los query params" do
        configuracion = Configuracion.new
        configuracion.que cuandoEntroA: "/foo", vayaA: "miGoogle"

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
        configuracion.que cuandoEntroA: "/bar", vayaA: "miGoogle"

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
        configuracion.que cuandoEntroA: "/foo", vayaA: "otroLado"

        internet = InternetDeMentira.new({
          "otroLado" => "<h1>Hola! soy otro lado</h1>",
        })

        respuesta= Tonel.new(configuracion, internet).transformar("/foo")
        respuesta.estado.should eq 200
        respuesta.contenido.should eq "<h1>Hola! soy otro lado</h1>"
      end

      context "pero `otroLado` devuelve un 404" do
        it "deberia responderme un error" do
          configuracion = Configuracion.new
          configuracion.que cuandoEntroA: "/foo", vayaA: "otroLado"

          internet = InternetDeMentira.new()

          respuesta= Tonel.new(configuracion, internet).transformar("/foo")
          respuesta.estado.should eq 404
        end
      end
    end

  end
end
