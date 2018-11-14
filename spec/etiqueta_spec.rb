require "spec_helper"

RSpec.describe Etiqueta do
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
    expect((Etiq.new("Queso",0.1,0.09,3.5,3.5,8.0,0.1)).to_s).to eq("Queso, grasa 0.1g de las cuales saturada 0.09g, hidratos de carbono 3.5g de los cuales azucares 3.5g, proteinas 8.0g, sal 0.1g")
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
end
