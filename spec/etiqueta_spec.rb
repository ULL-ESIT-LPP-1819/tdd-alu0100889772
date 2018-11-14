require "spec_helper"

RSpec.describe Etiqueta do
  it "has a version number" do
    expect(Etiqueta::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(false)
  end
  
  it "guarda el nombre" do
    expect((Etiq.new("Queso",0.1,0.09,3.5,3.5,8,0.1)).nombre).to eq("Queso")
  end
  
  it "guarda los atributos" do
    expect((Etiq.new("Queso",0.1,0.09,3.5,3.5,8,0.1)).to_s).to eq("Queso, grasa 0.1g de las cuales saturada 0.09g, hidratos de carbono 3.5g de los cuales azucares 3.5g, proteinas 8g, sal 0.1g")
  end
  
  it "calcula kilojulios" do
    expect((Etiq.new("Queso",0.1,0.09,3.5,3.5,8,0.1)).nrg_kj).to eq(201.7)
  end
  
  it "recibe atributos opcionales" do
    expect((Etiq.new("Queso",0.1,0.09,3.5,3.5,8,0.1,0.006,0.004)).poliinsat).to eq(0.004)
  end
  
  it "calcula calorias" do
    expect((Etiq.new("Queso",0.1,0.09,3.5,3.5,8,0.1)).nrg_kj).to eq(50.3)
  end
  
end
