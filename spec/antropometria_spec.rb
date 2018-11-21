require "spec_helper"

RSpec.describe Etiqueta do
    
    before :each do
        @datos = Antropometria.new(70.0,1.80,25,1,94.0,108.0)
    end
    
    it "crea objeto Antropometría" do
        expect((Antropometria.new(70.0,1.80,25,1,94.0,108.0)).class).to eq(Antropometria)
    end
    
    expect(@datos.imc).to eq(23.4)
    
end