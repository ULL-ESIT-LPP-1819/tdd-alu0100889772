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
        expect(@datos.grasa).to eq(29.58)
    end
    
    it "calcula el rcc" do
        expect(@datos.rcc).to eq(0.84)
    end
    
    it "analiza el imc" do
        expect(@datos.analisis_imc).to eq("Adecuado(aceptable)")
    end
    
    it "comprueba si se calcula imc" do
        expect(@datos.imc_empty).to eq(false)
    end
    
    it "crea objeto Individuo" do
        expect((Individuo.new(70.0,1.80,25,1,94.0,108.0)).class).to eq(Antropometria)
    end
    
end