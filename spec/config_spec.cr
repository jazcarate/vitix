require "./spec_helper"

describe Config do
  describe "#transform" do
    context "cuando no configuras nada" do
      it "deberia renderizar un 404" do
        Config.new.transformar("/CualquierCosa").render.should eq "404"
      end
    end
  end
end
