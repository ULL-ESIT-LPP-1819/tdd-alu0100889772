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
        (@grasa*9)+(@hidrato*4)+(@proteina*4)+(@sal*6)+(@monoinsat*9)+(@poliinsat*9)+(@polialco*2.4)+(@almidon*4)+(@fibra*2)
    end
    
    def nrg_kj_ir
        (nrg_kj/8400).round(4)*100
    end
    
    def nrg_cal_ir
        (nrg_kj/2000).round(4)*100
    end
    
    def grasa_ir
        (@grasa/70).round(4)*100
    end
    
    def saturada_ir
        (@saturada/20).round(4)*100
    end
    
    def hidrato_ir
        (@hidrato/260).round(4)*100
    end
    
    def azucar_ir
        (@azucar/90).round(4)*100
    end
    
    def proteina_ir
        (@proteina/50).round(4)*100
    end
    
    def sal_ir
        (@sal/6).round(4)*100
    end
  end
#end
