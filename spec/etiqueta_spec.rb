require "spec_helper"
require "./lib/etiqueta/etiq"

RSpec.describe Etiqueta do
  it "has a version number" do
    expect(Etiqueta::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(false)
  end
  
  it "guarda los atributos" do
    expect((Etiq.new("Hamburguesa")).name).to eq("Hamburguesa")
  end
end
