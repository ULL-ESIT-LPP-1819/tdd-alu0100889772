require "spec_helper"

RSpec.describe Etiqueta do

    before :each do
        @datos = Antropometria.new(60.0,1.60,30,0,72.0,86.0)
        @datos2 = Antropometria.new(90.0,1.70,55,0,100.0,115.0)
        @persona1 = Individuo.new
        @persona2 = Individuo.new(90.0,1.70,55,0,100.0,115.0)
        @persona3 = Individuo.new(78.0,1.70,55,1,100.0,115.0)
        @persona4 = Individuo.new(60.0,1.30,55,0,100.0,115.0)
        @persona5 = Individuo.new(90.0,1.60,55,1,100.0,115.0)
        @list = Node.new
        @list.push_tail(@persona1)
        @list.push_tail(@persona2)
        @list.push_tail(@persona3)
        @list.push_tail(@persona4)
        @list.push_tail(@persona5)
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
    
    it "crea objeto Individuo" do
        expect((Individuo.new).class).to eq(Individuo)
    end
    
    it "sabe si es paciente o no" do
        expect(@persona1.paciente).to eq(false)
    end
    
    it "sabe si esta en tratamiento para obesidad" do
        expect(@persona2.obeso).to eq(true)
    end
    
    it "comprobación tipo de objeto" do
        expect((Individuo.new).is_a?(Antropometria)).to eq(true)
        expect((Individuo.new).is_a?(Individuo)).to eq(true)
    end
    
    it "comprobación jerarquía" do
        expect(Individuo.ancestors).to eq([Individuo, Antropometria, Comparable, Object, Kernel, BasicObject])
    end
    
    it "compara dos individuos" do
        expect(@datos).to be < @datos2
            
        expect(@persona2).to eq(@persona2)
        expect(@persona2).to eq(@persona2)
        
        expect(@persona3 < @persona2).to eq(true)
        
        expect(@persona2 > @persona3).to be(true)
        
        expect(@persona3 <= @persona2).to be(true)
        expect(@persona4 <= @persona4).to be(true)
        expect(@persona5 <= @persona4).to be(true)
        
        expect(@persona4 >= @persona5).to be(true)
        expect(@persona5 >= @persona5).to be(true)
        expect(@persona2 >= @persona3).to be(true)
      end

end