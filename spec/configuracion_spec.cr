require "./spec_helper"

#Flaky; pero puedo vivir con eso :D
describe Configuracion do
  describe "#elejirRegla/1" do
    context "cuando configuro dos servidores para la misma regla" do
      it "deberia elegir indistintamente a cada servidor" do
        configuracion = Configuracion.new
        configuracion.que cuandoEntroA: "/foo", vayaA: "unServidor"
        configuracion.que cuandoEntroA: "/foo", vayaA: "otroServidor"

        unaRegla = configuracion.elejirRegla "/foo"
        otraRegla = configuracion.elejirRegla "/foo"

        unaRegla.should_not eq otraRegla
      end
    end
    context "una más probable que otra" do
      it "deberia elegir siempre la misma" do
        configuracion = Configuracion.new
        configuracion.que cuandoEntroA: "/foo", vayaA: "unServidor", conProbabilidad: 10
        configuracion.que cuandoEntroA: "/foo", vayaA: "otroServidor"

        unaAccion = configuracion.transformar "/foo"
        otraAccion = configuracion.transformar "/foo"

        unaAccion == otraAccion
      end
    end
  end
end
