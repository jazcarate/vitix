require "./spec_helper"

describe ConfigReader do
  describe "#crear_config/1" do
    context "cuando no configuras nada" do
      it "deberia responder un error 404 si enctro a cualqueir lado" do
        config = ConfigReader.crear_config(
        "---
          tonel:
            tiempoMuerto: 120
            reglas:
              - desde: /foo
                a:
                  - unServer
                  - otroServer
              - desde: /bar
                a: sarasa"
        )

        config.reglas.empty?.should_not be_true
        config.reglas[0].de.should eq "/foo"
        config.reglas[0].a.should be_a(MultiplesServidores)
      end
    end
  end
end
