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
        ((nrg_kj/8400)*10000).floor / 100.0
    end
    
    def nrg_cal_ir
        ((nrg_kj/2000)*10000).floor / 100.0
    end
    
    def grasa_ir
        ((@grasa/70)*10000).floor / 100.0
    end
    
    def saturada_ir
        ((@saturada/20)*10000).floor / 100.0
    end
    
    def hidrato_ir
        ((@hidrato/260)*10000).floor / 100.0
    end
    
    def azucar_ir
        ((@azucar/90)*10000).floor / 100.0
    end
    
    def proteina_ir
        ((@proteina/50)*10000).floor / 100.0
    end
    
    def sal_ir
        ((@sal/6)*10000).floor / 100.0
    end
    
    def formato
        "
    Queso               Cada 100g o 100ml      IR
    
    Valor energético             #{nrg_kj} kj    #{nrg_kj_ir}%
    (kj/kcal)                   #{nrg_cal} kcal
    
    Grasas de las                   #{@grasa} g   #{grasa_ir}%
    cuales:
    Saturadas                      #{@saturada} g   #{saturada_ir}%
    Monoinsaturadas                   #{@monoinsat} g       -
    Poliinsaturadas                   #{@poliinsat} g       -
    
    Hidratos de                     #{@hidrato} g   #{hidrato_ir}% 
    carbono de los
    cuales:
    Azucares                        #{@azucar} g   #{azucar_ir}%
    Polialcoholes                     #{@polialco} g       -
    Almidones                         #{@almidon} g       -
    
    Fibra alimentaria                 #{@fibra} g       -
    
    Proteinas                       #{@proteina} g   #{proteina_ir}%
    
    Sal                             #{@sal} g   #{sal_ir}%"
    end
  end
#end

class Lista
    Node = Struct.new(:value, :next, :prev)
    attr_reader :head, :tail
    def initialize(value)
        nuevo_nodo = Node.new(value, nil, nil)
        @head, @tail = nuevo_nodo, nuevo_nodo
    end
    
    def to_s
        nodo = @head
        chain = ""
        fin=false
        while(fin==false) do
            chain = chain + "#{nodo.value} "
            
            if(nodo!=tail)
                nodo=@head.next
            elsif(nodo==tail)
                fin=true
            end
        end
        chain[0,chain.size-1]
    end
    
    def push_tail(value)
        nuevo_nodo = Node.new(value, nil, @tail)
        @tail.next=nuevo_nodo
        @tail = nuevo_nodo
    end
    
    def push_head(value)
        nuevo_nodo = Node.new(value, @head, nil)
        @head.prev=nuevo_nodo
        @head = nuevo_nodo
    end
    
    def pop_head()
        elim_nodo = @head
        @head = elim_nodo.next
        @head.prev = nil
    end
    
    def pop_tail()
        elim_nodo = @tail
        @tail = elim_nodo.prev
        @tail.next = nil
    end
    
end