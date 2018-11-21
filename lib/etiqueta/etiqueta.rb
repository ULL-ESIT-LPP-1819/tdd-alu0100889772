require "etiqueta/version"


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


Node = Struct.new(:value, :next, :prev) do
    attr_reader :head, :tail
    
    
    def to_s
        nodo = self.get_head
        chain = ""
        fin=false
        chain = chain + "#{nodo.value.to_s} "
        while(fin==false) do
            
            if(nodo!=self.get_tail)
                nodo = nodo.next
                chain = chain + "#{nodo.value} "
            end
            if(nodo==self.get_tail)
                fin=true
            end
        end
        chain[0,chain.size-1]
    end
    
    def get_head
        if(self.prev==nil)
            self
        elsif(self.prev!=nil)
            self.prev.get_head
        end
    end
    
    def get_tail
        if(self.next==nil)
            self
        elsif(self.next!=nil)
            self.next.get_tail
        end
    end
    
    def empty
        if(self.value==nil)
            true
        elsif(self.value!=nil)
            false
        end
    end
    
    def push_tail(value)
        nuevo_nodo = Node.new(value, nil, self.get_tail)
        if(empty)
            self.value=value
            self.next=nil
            self.prev=nil
        elsif(!empty)
            self.get_tail.next=nuevo_nodo
        end
    end
    
    def push_head(value)
        nuevo_nodo = Node.new(value, self.get_head, nil)
        if(empty)
            self.value=value
            self.next=nil
            self.prev=nil
        elsif(!empty)
            self.get_head.prev=nuevo_nodo
        end
    end
    
    def pop_head
        elim_nodo = self.get_head
        if(empty)
        elsif(self.get_head!=self.get_tail)
            self.get_head = elim_nodo.next
            self.get_head.prev = nil
        elsif(self.get_head==self.get_tail)
            self.value=nil
            self.prev=nil
            self.next=nil
        end
    end
    
    def pop_tail
        elim_nodo = self.get_tail
        if(empty)
        elsif(self.get_head!=self.get_tail)
            self.get_tail = elim_nodo.prev
            self.get_tail.next = nil
        elsif(self.get_head==self.get_tail)
            self.value=nil
            self.prev=nil
            self.next=nil
        end
    end
    
end

class Antropometria
    attr_reader :peso, :talla, :edad, :sexo, :cintura, :cadera
    def initialize(peso,talla,edad,sexo,cintura,cadera)
        @peso, @talla, @edad, @sexo, @cintura, @cadera = peso, talla, edad, sexo, cintura, cadera
    end
    
    def imc
        if(@talla!=0.0)
            (@peso/(@talla*@talla)).round(1)
        else
            0.0
        end
    end
    
    def grasa
        if((sexo==0)||(sexo==1))
            (1.2*imc+0.23*@edad-10.8*sexo-5.4).round(2)
        else
            0.0
        end
    end
    
    def rcc
        if(@cadera!=0.0)
            (@cintura/@cadera).round(2)
        else
            0.0
        end
    end
    
    def analisis_imc
        if(imc<18.5)
            "Bajo peso(delgado)"
        elsif(imc<24.9)
            "Adecuado(aceptable)"
        elsif(imc<29.9)
            "Sobrepeso"
        elsif(imc<34.9)
            "Obesidad grado 1(obesidad)"
        elsif(imc<39.9)
            "Obesidad grado 2(obesidad)"
        elsif(imc>39.9)
            "Obesidad grado 3(obesidad)"
        end
    end
        
end

class Individuo < Antropometria
    def initialize(peso=0.0,talla=0.0,edad=0,sexo=2,cintura=0.0,cadera=0.0)
        super
    end
    
    def paciente
        if((imc==0.0)&&(rcc==0.0)&&(grasa==0.0))
           false
        else
           true
        end
    end
    
    def obeso
        if(!paciente)
            false
        elsif((analisis_imc=="Obesidad grado 1(obesidad)")||(analisis_imc=="Obesidad grado 2(obesidad)")||(analisis_imc=="Obesidad grado 3(obesidad)"))
            true
        else
            false
        end
    end
        
end
