require "spec_helper"

RSpec.describe Etiqueta do
    
    before :each do
        @datos = Antropometria.new(60.0,1.60,30,0,72.0,86.0)
    end
    
    it "crea objeto Antropometría" do
        expect((Antropometria.new(70.0,1.80,25,1,94.0,108.0)).class).to eq(Antropometria)
    end
    
    it "calcula el imc" do
        expect(@datos.imc).to eq(23.4)
    end
    
    it "calcula el porcentaje de grasa" do
        expect(@mujer1.grasa).to eq(29.58)
    end
    
end