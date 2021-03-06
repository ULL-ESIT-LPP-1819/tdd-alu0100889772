require "spec_helper"

RSpec.describe Etiqueta do
  
  before :each do
    @lista = Node.new(nil,nil,nil)
    @etiq1 = Etiq.new("Queso",0.1,0.09,3.5,3.5,8.0,0.1)
    @etiq2 = Etiq.new("Spaghetti",1.2,0.2,57.6,2.6,9.2,0.01)
    @etiq3 = Etiq.new("Queso",0.1,0.09,3.5,3.5,8.0,0.1)
    @etiq4 = Etiq.new("Queso",0.2,0.19,4.5,4.5,9.0,0.2)
  end
  
  it "has a version number" do
    expect(Etiqueta::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(false)
  end
  
  it "guarda el nombre" do
    expect((Etiq.new("Queso",0.1,0.09,3.5,3.5,8.0,0.1)).nombre).to eq("Queso")
  end
  
  it "guarda los atributos" do
    #expect((Etiq.new("Queso",0.1,0.09,3.5,3.5,8.0,0.1)).to_s).to eq("Queso, grasa 0.1g de las cuales saturada 0.09g, hidratos de carbono 3.5g de los cuales azucares 3.5g, proteinas 8.0g, sal 0.1g")
  end
  
  it "calcula kilojulios" do
    expect((Etiq.new("Queso",0.1,0.09,3.5,3.5,8.0,0.1)).nrg_kj).to eq(201.7)
  end
  
  it "recibe atributos opcionales" do
    expect((Etiq.new("Queso",0.1,0.09,3.5,3.5,8.0,0.1,0.006,0.004)).poliinsat).to eq(0.004)
  end
  
  it "calcula calorias" do
    expect((Etiq.new("Queso",0.1,0.09,3.5,3.5,8.0,0.1)).nrg_cal).to eq(47.5)
  end
  
  it "calcula IR" do
    expect((Etiq.new("Queso",0.1,0.09,3.5,3.5,8.0,0.1)).nrg_kj_ir).to eq(2.4)
  end
  
  it "guarda proteina" do
    expect((Etiq.new("Queso",0.1,0.09,3.5,3.5,8.0,0.1,0.006,0.004)).proteina).to eq(8)
  end
  
  it "muestra la etiqueta" do
    expect((Etiq.new("Queso",0.1,0.09,3.5,3.5,8.0,0.1)).formato).to eq("
    Queso               Cada 100g o 100ml      IR
    
    Valor energético             201.7 kj    2.4%
    (kj/kcal)                   47.5 kcal
    
    Grasas de las                   0.1 g   0.14%
    cuales:
    Saturadas                      0.09 g   0.45%
    Monoinsaturadas                   0 g       -
    Poliinsaturadas                   0 g       -
    
    Hidratos de                     3.5 g   1.34% 
    carbono de los
    cuales:
    Azucares                        3.5 g   3.88%
    Polialcoholes                     0 g       -
    Almidones                         0 g       -
    
    Fibra alimentaria                 0 g       -
    
    Proteinas                       8.0 g   16.0%
    
    Sal                             0.1 g   1.66%")
  end
  
  it "crea una lista" do
    a = Node.new(nil,nil,nil)
  end
  
  it "pushea un nodo" do
    @lista.push_tail(2)
  end
  
  it "dice si la lista está vacía" do
    @lista.push_tail(2)
    expect(@lista.empty).to eq(false)
    @lista.pop_head
    expect(@lista.empty).to eq(true)
  end
  
  it "muestra lista" do
    @lista.push_tail(3)
    @lista.push_tail(2)
    @lista.push_tail(1)
    @lista.push_tail(1)
    @lista.push_tail(5)
    expect(@lista.to_s).to eq("3 2 1 1 5")
  end
  
  it "elimina un nodo" do
    @lista.push_tail(2)
    @lista.pop_tail
    expect(@lista.empty).to eq(true)
  end
  
  it "almacena etiquetas" do
    list = (Node.new(nil,nil,nil))
    list.push_head(Etiq.new("Queso",0.1,0.09,3.5,3.5,8.0,0.1))
    expect(list.get_head.value.formato).to eq("
    Queso               Cada 100g o 100ml      IR
    
    Valor energético             201.7 kj    2.4%
    (kj/kcal)                   47.5 kcal
    
    Grasas de las                   0.1 g   0.14%
    cuales:
    Saturadas                      0.09 g   0.45%
    Monoinsaturadas                   0 g       -
    Poliinsaturadas                   0 g       -
    
    Hidratos de                     3.5 g   1.34% 
    carbono de los
    cuales:
    Azucares                        3.5 g   3.88%
    Polialcoholes                     0 g       -
    Almidones                         0 g       -
    
    Fibra alimentaria                 0 g       -
    
    Proteinas                       8.0 g   16.0%
    
    Sal                             0.1 g   1.66%")
  end

  it "compara dos etiquetas ==" do
    expect(@etiq1 == @etiq1).to eq(true)
    expect(@etiq1 == @etiq3).to eq(true)
    expect(@etiq1 == @etiq2).to eq(false)
  end
  
  it "compara dos etiquetas" do
    
    expect(@etiq1).to eq(@etiq1)
    expect(@etiq1).to eq(@etiq3)
    
    expect(@etiq1).to be < @etiq2
    
    expect(@etiq2).to be > @etiq1
    
    expect(@etiq1).to be <= @etiq1
    expect(@etiq1).to be <= @etiq3
    expect(@etiq1).to be <= @etiq2
    
    expect(@etiq1).to be >= @etiq1
    expect(@etiq1).to be >= @etiq3
    expect(@etiq2).to be >= @etiq1
  end
  
  it "usa enumerable" do
    @lista.push_head(@etiq1)
    @lista.push_head(@etiq2)
    @lista.push_head(@etiq4)
    
    s=[]
    @lista.each do |x|
      s.push(x.to_s)
    end
    expect("#{s}").to eq("[\"57.0\", \"278.06\", \"47.5\"]")
    
    expect(@lista.max.to_s).to eq("278.06")
    expect(@lista.min.to_s).to eq("47.5")
    
    s=[]
    @lista.collect do |x|
      s.push(x.to_s)
    end
    expect("#{s}").to eq("[\"57.0\", \"278.06\", \"47.5\"]")
    
    puts @lista.select{|x| @etiq2 == x}
    
    s=[]
    @lista.sort.each do |x|
      s.push(x.to_s)
    end
    expect("#{s}").to eq("[\"47.5\", \"57.0\", \"278.06\"]")
    
  end

end
