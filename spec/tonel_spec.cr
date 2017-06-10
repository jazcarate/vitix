require "./spec_helper"

describe Tonel do
  describe "#transform/1" do
    context "cuando no configuras nada" do
      it "deberia responder un error 404 si enctro a cualqueir lado" do
        Tonel.new(Configuracion.new).transformar("/CualquierCosa").estado.should eq 404
      end
    end

    context "cuando configuro que `/foo` sea `miGoogle`" do
      it "deberia responderme con estado 200 y el contenido de miGoogle" do
        configuracion = Configuracion.new
        configuracion.que cuandoEntroA: "/foo", vayaA: "miGoogle"

        respuesta= Tonel.new(configuracion).transformar("/foo")
        respuesta.estado.should eq 200
        respuesta.contenido.should eq "<h1>Hola! soy TuGoogle</h1>"
      end
    end
    context "cuando configuro que `/bar` sea `miGoogle`" do
      it "deberia responderme con estado 200 y el contenido de miGoogle" do
        configuracion = Configuracion.new
        configuracion.que cuandoEntroA: "/bar", vayaA: "miGoogle"

        respuesta= Tonel.new(configuracion).transformar("/bar")
        respuesta.estado.should eq 200
        respuesta.contenido.should eq "<h1>Hola! soy TuGoogle</h1>"
      end
    end
    context "cuando configuro que `/foo` sea `otroLado`" do
      it "deberia responderme con estado 200 y el contenido de otroLado" do
        configuracion = Configuracion.new
        configuracion.que cuandoEntroA: "/foo", vayaA: "otroLado"

        respuesta= Tonel.new(configuracion).transformar("/foo")
        respuesta.estado.should eq 200
        respuesta.contenido.should eq "<h1>Hola! soy otro lado</h1>"
      end
    end
  end
end
