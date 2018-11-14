require "etiqueta/version"

#module Etiqueta
  class Etiq

    attr_reader :nombre, :grasa, :saturada, :hidrato, :azucar, :proteina, :sal, :monoinsat, :poliinsat, :polialco, :almidon, :fibra
    
    def initialize(nombre, grasa, saturada, hidrato, azucar, proteina, sal, monoinsat=0, poliinsat=0, polialco=0, almidon=0, fibra=0)
        @nombre, @grasa, @saturada, @hidrato, @azucar, @proteina, @sal, @monoinsat, @poliinsat, @polialco, @almidon, @fibra = nombre, grasa, saturada, hidrato, azucar, proteina, sal, monoinsat, poliinsat, polialco, almidon, fibra
    end
    
    def to_s
        "#{@nombre}, grasa #{@grasa}g de las cuales saturada #{@saturada}g, hidratos de carbono #{@hidrato}g de los cuales azucares #{@azucar}g, proteinas #{@proteina}g, sal #{@sal}g"
    end
    
    def nrg_kj
        (@grasa*37)+(@hidrato*17)+(@proteina*17)+(@sal*25)+(@monoinsat*37)+(@poliinsat*37)+(@polialco*10)+(@almidon*17)+(@fibra*8)
    end
    
    def nrg_cal
        
    end
  end
#end
