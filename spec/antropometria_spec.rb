require "spec_helper"

RSpec.describe Etiqueta do
    
    it "crea objeto Antropometría" do
        expect((Antropometria.new(70.0,1.80,25,1,94.0,108.0)).class).to eq(Antropometria)
    end
    
end