require "etiqueta/version"

# @author Alberto Delgado Soler
class Etiq

    include Comparable
    include Enumerable

    attr_reader :nombre, :grasa, :saturada, :hidrato, :azucar, :proteina, :sal, :monoinsat, :poliinsat, :polialco, :almidon, :fibra
    
    # Calcula el valor energético en kilojulios
    # @param 
    # @return [Float] the result in kj
    def initialize(nombre, grasa, saturada, hidrato, azucar, proteina, sal, monoinsat=0, poliinsat=0, polialco=0, almidon=0, fibra=0)
        @nombre, @grasa, @saturada, @hidrato, @azucar, @proteina, @sal, @monoinsat, @poliinsat, @polialco, @almidon, @fibra = nombre, grasa, saturada, hidrato, azucar, proteina, sal, monoinsat, poliinsat, polialco, almidon, fibra
    end
    
    def to_s
        "#{nrg_cal}"
        #"#{@nombre}, grasa #{@grasa}g de las cuales saturada #{@saturada}g, hidratos de carbono #{@hidrato}g de los cuales azucares #{@azucar}g, proteinas #{@proteina}g, sal #{@sal}g"
    end
    
    # Calcula el valor energético en kilojulios
    # @return [Float] the result in kj
    def nrg_kj
        (@grasa*37)+(@hidrato*17)+(@proteina*17)+(@sal*25)+(@monoinsat*37)+(@poliinsat*37)+(@polialco*10)+(@almidon*17)+(@fibra*8)
    end
    
    # Calcula el valor energético en calorias
    # @return [Float] the result in calorias
    def nrg_cal
        (@grasa*9)+(@hidrato*4)+(@proteina*4)+(@sal*6)+(@monoinsat*9)+(@poliinsat*9)+(@polialco*2.4)+(@almidon*4)+(@fibra*2)
    end
    
    # Calcula el porcentaje según el IR del valor energético en kilojulios
    # @return [Float] the result in kj
    def nrg_kj_ir
        ((nrg_kj/8400)*10000).floor / 100.0
    end
    
    # Calcula el porcentaje según el IR del valor energético en calorias
    # @return [Float] the result in calorias
    def nrg_cal_ir
        ((nrg_kj/2000)*10000).floor / 100.0
    end
    
    # Calcula el porcentaje según el IR de la grasa
    # @return [Float] the result
    def grasa_ir
        ((@grasa/70)*10000).floor / 100.0
    end
    
    # Calcula el porcentaje según el IR de la grasa
    # @return [Float] the result
    def saturada_ir
        ((@saturada/20)*10000).floor / 100.0
    end
    
    # Calcula el porcentaje según el IR de la grasa
    # @return [Float] the result
    def hidrato_ir
        ((@hidrato/260)*10000).floor / 100.0
    end
    
    # Calcula el porcentaje según el IR de la grasa
    # @return [Float] the result
    def azucar_ir
        ((@azucar/90)*10000).floor / 100.0
    end
    
    # Calcula el porcentaje según el IR de la grasa
    # @return [Float] the result
    def proteina_ir
        ((@proteina/50)*10000).floor / 100.0
    end
    
    # Calcula el porcentaje según el IR de la grasa
    # @return [Float] the result
    def sal_ir
        ((@sal/6)*10000).floor / 100.0
    end
    
    # Le da formato la etiqueta para poder ser legible
    # @return [String] the result
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
    
    # Calcula las comparaciones entre etiquetas según el valor energético en kilojulios
    # @return [Int] -1 0 1
    def <=>(other)
        return nil unless other.instance_of? Etiq
        nrg_cal <=> other.nrg_cal
    end
    
    # Calcula las comparacion == entre etiquetas según el valor energético en kilojulios
    # @return [Bool] true false
    def ==(other)
        return nil unless other.instance_of? Etiq
        if(@nombre==other.nombre && @grasa==other.grasa && @saturada==other.saturada && @hidrato==other.hidrato && @azucar==other.azucar && @proteina==other.proteina && @sal==other.sal && @monoinsat==other.monoinsat && @poliinsat==other.poliinsat && @polialco==other.polialco && @almidon==other.almidon && @fibra==other.fibra)
            return true
        end
        false
    end
end

# @author Alberto Delgado Soler
Node = Struct.new(:value, :next, :prev) do
    
    include Enumerable
    
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
    
    def each
        nodo = get_head
        while nodo != nil
            yield nodo.value
            nodo = nodo.next
        end
    end
    
end

# @author Alberto Delgado Soler
class Antropometria
    
    include Comparable
    
    attr_reader :peso, :talla, :edad, :sexo, :cintura, :cadera
    def initialize(peso,talla,edad,sexo,cintura,cadera)
        @peso, @talla, @edad, @sexo, @cintura, @cadera = peso, talla, edad, sexo, cintura, cadera
    end
    
    def to_s
        "#{imc}"
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
    
    def <=>(other)
        return nil unless other.instance_of? Antropometria
        self.imc <=> other.imc
    end
        
end

# @author Alberto Delgado Soler
class Individuo < Antropometria
    
    #include Comparable
    
    def initialize(peso=0.0,talla=0.0,edad=0,sexo=2,cintura=0.0,cadera=0.0)
        super
    end
    
    def to_s
        "#{imc}"
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
    
    def <=>(other)
        return nil unless other.instance_of? Individuo
        self.imc <=> other.imc
    end
        
end
