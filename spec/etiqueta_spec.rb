require "spec_helper"
require "./lib/etiqueta/etiq"

RSpec.describe Etiqueta do
  it "has a version number" do
    expect(Etiqueta::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(false)
  end
  
  it "guarda el nombre" do
    expect((Etiq.new("Hamburguesa")).name).to eq("Hamburguesa")
  end
  
  it "guarda los atributos" do
    expect((Etiq.new("Queso",0.1,0.09,3.5,3.5,8,0.1)).to_s).to eq("Queso, grasa 0.1g de las cuales saturada 0.09g, hidratos de carbono 3.5g de los cuales azucares 3.5g, proteinas 8g, sal 0.1g")
  end
  
end