require "./spec_helper"

describe Regla do
  describe "#a/1" do
    context "cuando configuro una regla" do
      it "conserva los query params" do
        laRegla = Regla.new "/foo", "/bar"

        laRegla.a("/foo?lala=3").should eq "/bar?lala=3"
      end
    end
  end
end
