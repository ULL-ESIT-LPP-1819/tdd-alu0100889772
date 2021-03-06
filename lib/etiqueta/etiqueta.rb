require "etiqueta/version"

# @author Alberto Delgado Soler
class Etiq

    include Comparable
    include Enumerable

    attr_reader :nombre, :grasa, :saturada, :hidrato, :azucar, :proteina, :sal, :monoinsat, :poliinsat, :polialco, :almidon, :fibra
    
    # Calcula el valor energético en kilojulios
    # @param nombre [String] nombre de la etiqueta
    # @param grasa [Int] cantidad de grasa en gr
    # @param saturada [Int] de la cantidad de grasa cuánta es saturada en gr
    # @param hidrato [Int] cantidad de hidratos de carbono en gr
    # @param azucar [Int] de la cantidad de hidratos de carbono cuánto es azúcar en gr
    # @param proteina [Int] cantidad de proteínas en gr
    # @param sal [Int] cantidad de sal en gr
    # @param monoinsat [Int] cantidad de grasas monoinsaturadas en gr
    # @param poliinsat [Int] cantidad de grasas poliinsaturadas en gr
    # @param polialco [Int] cantidad de polialcohol en gr
    # @param almidon [Int] cantidad de almidon en gr
    # @param fibra [Int] cantidad de fibra en gr
    # @return [Float] the result in kj
    def initialize(nombre, grasa, saturada, hidrato, azucar, proteina, sal, monoinsat=0, poliinsat=0, polialco=0, almidon=0, fibra=0)
        @nombre, @grasa, @saturada, @hidrato, @azucar, @proteina, @sal, @monoinsat, @poliinsat, @polialco, @almidon, @fibra = nombre, grasa, saturada, hidrato, azucar, proteina, sal, monoinsat, poliinsat, polialco, almidon, fibra
    end
    
    # Método to_s de la clase
    # @return [String] valor energético en kilojulios en forma de string
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
    
    attr_reader :head, :tail, :size
    
    # Método to_s del struct
    # @return [String] to_s de cada valor de los nodos de la lista
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
    
    def to_array
        nodo = self.get_head
        array = []
        fin=false
        array.push(nodo.value)
        while(fin==false) do
            
            if(nodo!=self.get_tail)
                nodo = nodo.next
                array.push(nodo.value)
            end
            if(nodo==self.get_tail)
                fin=true
            end
        end
        array
    end
    
    # Método get_head del struct
    # @return [Node] devuelve el nodo que está a la CABEZA de la lista
    def get_head
        if(self.prev==nil)
            self
        elsif(self.prev!=nil)
            self.prev.get_head
        end
    end
    
    # Método get_tail del struct
    # @return [Node] devuelve el nodo que está a la COLA de la lista
    def get_tail
        if(self.next==nil)
            self
        elsif(self.next!=nil)
            self.next.get_tail
        end
    end
    
    # Método empty del struct
    # @return [Bool] devuelve true si la lista está vacia o false si la lista tiene algún elemento
    def empty
        if(self.value==nil)
            true
        elsif(self.value!=nil)
            false
        end
    end
    
    # Método push_tail del struct
    # @param value [Object] introduce el onjeto en la lista por la COLA
    def push_tail(value)
        nuevo_nodo = Node.new(value, nil, self.get_tail)
        if(empty)
            @size=1
            self.value=value
            self.next=nil
            self.prev=nil
        elsif(!empty)
            @size+=1
            self.get_tail.next=nuevo_nodo
        end
    end
    
    # Método push_head del struct
    # @param value [Object] introduce el onjeto en la lista por la CABEZA
    def push_head(value)
        nuevo_nodo = Node.new(value, self.get_head, nil)
        if(empty)
            @size=1
            self.value=value
            self.next=nil
            self.prev=nil
        elsif(!empty)
            @size+=1
            self.get_head.prev=nuevo_nodo
        end
    end
    
    # Método pop_head del struct que quita el objeto que esté en la CABEZA de la lista
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
    
    # Método pop_head del struct que quita el objeto que esté en la COLA de la lista
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
    
    # Método each para que funcionen los métodos del módulo Enumerable
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
    
    # Calculps antropométricos 
    # @param peso [Float] peso en kilogramos
    # @param talla [Float] altura en metros
    # @param edad [Int] edad de la persona
    # @param sexo [Int] valor 0 para chica y 1 para chico
    # @param cintura [Float] medida de la cintura en centímetros
    # @param cadera [Float] medida de la cadera en centímetros
    def initialize(peso,talla,edad,sexo,cintura,cadera)
        @peso, @talla, @edad, @sexo, @cintura, @cadera = peso, talla, edad, sexo, cintura, cadera
    end
    
    # Método to_s de la clase
    # @return [String] to_s del valor imc
    def to_s
        "#{imc}"
    end
    
    # Método que realiza el cálculo del imc
    # @return [Float] devuelve el valor imc
    def imc
        if(@talla!=0.0)
            (@peso/(@talla*@talla)).round(1)
        else
            0.0
        end
    end
    
    # Método que realiza el cálculo del porcentaje de grasa
    # @return [Float] devuelve el valor grasa
    def grasa
        if((sexo==0)||(sexo==1))
            (1.2*imc+0.23*@edad-10.8*sexo-5.4).round(2)
        else
            0.0
        end
    end
    
    # Método que realiza el cálculo de la relación cintura - cadera
    # @return [Float] devuelve el rcc
    def rcc
        if(@cadera!=0.0)
            (@cintura/@cadera).round(2)
        else
            0.0
        end
    end
    
    # Método que devuelve que significado tiene el imc
    # @return [String] devuelve en forma de cadena que significa el imc calculado
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
    
    # Método que compara dos valores antropométricos según los imc
    # @return [Int] -1 0 1
    def <=>(other)
        return nil unless other.instance_of? Antropometria
        self.imc <=> other.imc
    end
        
end

# @author Alberto Delgado Soler
class Individuo < Antropometria
    
    # Calculos antropométricos de un individuo en concreto que hereda métodos de la clase Antropometría
    # @param peso [Float] peso en kilogramos
    # @param talla [Float] altura en metros
    # @param edad [Int] edad de la persona
    # @param sexo [Int] valor 0 para chica y 1 para chico
    # @param cintura [Float] medida de la cintura en centímetros
    # @param cadera [Float] medida de la cadera en centímetros
    def initialize(peso=0.0,talla=0.0,edad=0,sexo=2,cintura=0.0,cadera=0.0)
        super
    end
    
    # Método to_s de la clase
    # @return [String] to_s del valor imc
    def to_s
        "#{imc}"
    end
    
    # Método que dice si es paciente o no
    # @return [Bool] true si es paciente false si no lo es
    def paciente
        if((imc==0.0)&&(rcc==0.0)&&(grasa==0.0))
           false
        else
           true
        end
    end
    
    # Método que dice si es obeso o no
    # @return [Bool] true si es obeso false si no es obeso o no es paciente
    def obeso
        if(!paciente)
            false
        elsif((analisis_imc=="Obesidad grado 1(obesidad)")||(analisis_imc=="Obesidad grado 2(obesidad)")||(analisis_imc=="Obesidad grado 3(obesidad)"))
            true
        else
            false
        end
    end
    
    # Método que compara dos valores antropométricos según los imc
    # @return [Int] -1 0 1
    def <=>(other)
        return nil unless other.instance_of? Individuo
        self.imc <=> other.imc
    end
    
    # Método que calcula el peso teórico ideal del individuo
    # @return [Float] peso teórico ideal
    def peso_teo_ideal
        (@talla*100 - 150) * 0.75 + 50
    end
    
    # Método que calcula el gasto energético basal
    # @return [Float] gasto energético ideal
    def gast_nrg_basal
        x=0
        if(@sexo==0)
            x=-161
        else
            x=5
        end
        (10 * @peso) + (6.25 * @talla) - (5 * @edad) + x
    end
    
    # Método que calcula el efecto termógeno de los alimentos
    # @return [Float] efecto termógeno
    def efect_term
        gast_nrg_basal*0.1
    end
    
    # Método que calcula el gasto por actividad física
    # @param nivel_act [Int] nivel de la actividad realizada: 0 Reposo, 1 Actividad ligera, 2 Actividad moderada, 3 Actividad intensa
    # @return [Float] gasto por actividad física
    def act_fisica(nivel_act)
        if(nivel_act==0)
            factor=0.0
        elsif(nivel_act==1)
            factor=0.12
        elsif(nivel_act==2)
            factor=0.27
        elsif(nivel_act==3)
            factor=0.54
        end
        gast_nrg_basal * factor
    end
    
    # Método que calcula el gasto energético global
    # @param nivel_act [Int] nivel de la actividad realizada: 0 Reposo, 1 Actividad ligera, 2 Actividad moderada, 3 Actividad intensa
    # @return [Float] gasto energético global
    def gasto_nrg_global(nivel_act)
        gast_nrg_basal + efect_term + act_fisica(nivel_act)
    end
        
end

class Menu_antiguo

	def initialize(individuo)
		@individuo = individuo
		@comida = Node.new
	end
	
	def to_s
		@comida.to_s
	end	

	def nrg_value
		@comida.map{|x| x.nrg_cal}.reduce(:+)
	end
	
	def insert_comida(comida)
		@comida.push_tail(comida)
	end

    def verificar
        if(@comida.map{|x| x.nrg_cal}.reduce(:+).between?(@individuo.gasto_nrg_global(2)-0.1*@individuo.gasto_nrg_global(2),@individuo.gasto_nrg_global(2)+0.1*@individuo.gasto_nrg_global(2)))
                return true
        else
                return false
        end
    end

end


class Menu
    attr_accessor :name, :titulo, :ingesta, :desayuno, :almuerzo, :cena
    def initialize(name, &block)
        @name = name
        @titulo = ""
        @ingesta = []
        @desayuno = []
        @almuerzo = []
        @cena = []
    
        if block_given?  
            if block.arity == 1
                yield self
            else
                instance_eval(&block) 
            end
        end
    end
    
    #####################################################################################################################
    def to_s
        total=0
        
        output = "\n\t#{@name}"
        output << "\t\t\t\tComposición nutricional\n"
        output << "\t=============================================================================================\n"
        output << "\t\t\t\t\tgrasas\tcarbohidratos\tproteínas\tfibra\tsal\tvalor energético\n"
        output << "\tDesayuno\n"
        
        @desayuno.each do |des|
            output << "\t\"#{des[:descripcion]}\""  
            if(des[:descripcion].size<6)
                output << "\t"
            end
            if(des[:descripcion].size<13)
                output << "\t"
            end
            if(des[:descripcion].size<22)
                output << "\t"
            end
            output << "\t#{'%.2f' % des[:grasas]}"
            output << "\t#{'%.2f' % des[:carbohidratos]}"
            output << "\t\t#{'%.2f' % des[:proteinas]}"
            if (des[:fibra]!=nil)
                output << "\t\t#{'%.2f' % des[:fibra]}"
            elsif (des[:fibra]==nil)
                output << "\t\t0.00"
            end
            if (des[:sal]!=nil)
                output << "\t#{'%.2f' % des[:sal]}"
            elsif (des[:sal]==nil)
                output << "\t0.00"
            end
            output << "\t#{'%.2f' % nrg_cal(des)}"
            output << "\n"
            total+=nrg_cal(des)
        end
    
        output << "\n\tAlmuerzo\n"
        @almuerzo.each do |alm|
            output << "\t\"#{alm[:descripcion]}\"" 
            if(alm[:descripcion].size<6)
                output << "\t"
            end
            if(alm[:descripcion].size<11)
                output << "\t"
            end
            if(alm[:descripcion].size<21)
                output << "\t"
            end
            output << "\t#{'%.2f' % alm[:grasas]}"
            output << "\t#{'%.2f' % alm[:carbohidratos]}"
            output << "\t\t#{'%.2f' % alm[:proteinas]}"
            if (alm[:fibra]!=nil)
                output << "\t\t#{'%.2f' % alm[:fibra]}"
            elsif (alm[:fibra]==nil)
                output << "\t\t0.00"
            end
            if (alm[:sal]!=nil)
                output << "\t#{'%.2f' % alm[:sal]}"
            elsif (alm[:sal]==nil)
                output << "\t0.00"
            end
            output << "\t#{'%.2f' % nrg_cal(alm)}"
            output << "\n"
            total+=nrg_cal(alm)
        end
    
        output << "\n\tCena\n"
        @cena.each do |cen|
            output << "\t\"#{cen[:descripcion]}\""
            if(cen[:descripcion].size<6)
                output << "\t"
            end
            if(cen[:descripcion].size<11)
                output << "\t"
            end
            if(cen[:descripcion].size<21)
                output << "\t\t"
            end
            output << "\t#{'%.2f' % cen[:grasas]}"
            output << "\t#{'%.2f' % cen[:carbohidratos]}"
            output << "\t\t#{'%.2f' % cen[:proteinas]}"
            if (cen[:fibra]!=nil)
                output << "\t\t#{'%.2f' % cen[:fibra]}"
            elsif (cen[:fibra]==nil)
                output << "\t\t0.00"
            end
            if (cen[:sal]!=nil)
                output << "\t#{'%.2f' % cen[:sal]}"
            elsif (cen[:sal]==nil)
                output << "\t0.00"
            end
            output << "\t#{'%.2f' % nrg_cal(cen)}"
            output << "\n"
            total+=nrg_cal(cen)
        end
        
        output << "\tValor energético total\t\t"
        output << "#{'%.2f' % total}"
        
        output
    end
    
    ###################################################################################################################
    
    def titulo(aux)
        @titulo=aux
    end
    
    def ingesta(aux, options = {})
        ing = aux
        ing << " (#{options[:min]})" if options[:min]
        ing << " (#{options[:max]})" if options[:max]
    
        @ingesta << ing
    end
    
    def desayuno(aux, options = {})
        des = aux
        des << " (#{options[:descripcion]})" if options[:descripcion]
        des << " (#{options[:porcion]})" if options[:porcion]
        des << " (#{options[:gramos]})" if options[:gramos]
        des << " (#{options[:grasas]})" if options[:grasas]
        des << " (#{options[:carbohidratos]})" if options[:carbohidratos]
        des << " (#{options[:proteinas]})" if options[:proteinas]
        des << " (#{options[:fibra]})" if options[:fibra]
        des << " (#{options[:sal]})" if options[:sal]
        
        @desayuno << des
    end
    
    def almuerzo(aux, options = {})
        alm = aux
        alm << " (#{options[:descripcion]})" if options[:descripcion]
        alm << " (#{options[:porcion]})" if options[:porcion]
        alm << " (#{options[:gramos]})" if options[:gramos]
        alm << " (#{options[:grasas]})" if options[:grasas]
        alm << " (#{options[:carbohidratos]})" if options[:carbohidratos]
        alm << " (#{options[:proteinas]})" if options[:proteinas]
        alm << " (#{options[:fibra]})" if options[:fibra]
        alm << " (#{options[:sal]})" if options[:sal]
           
        @almuerzo << alm
    end
    
    def cena(aux, options = {})
        
        cen = aux
        cen << " (#{options[:descripcion]})" if options[:descripcion]
        cen << " (#{options[:porcion]})" if options[:porcion]
        cen << " (#{options[:gramos]})" if options[:gramos]
        cen << " (#{options[:grasas]})" if options[:grasas]
        cen << " (#{options[:carbohidratos]})" if options[:carbohidratos]
        cen << " (#{options[:proteinas]})" if options[:proteinas]
        cen << " (#{options[:fibra]})" if options[:fibra]
        cen << " (#{options[:sal]})" if options[:sal]
        
        @cena << cen
    end
    
    def nrg_cal(comida)
        nrg_value=0
        #(@grasa*37)+(@hidrato*17)+(@proteina*17)+(@sal*25)+(@monoinsat*37)+(@poliinsat*37)+(@polialco*10)+(@almidon*17)+(@fibra*8)
        if comida.class == Hash
        	nrg_value = (comida[:grasas] * 9) + (comida[:carbohidratos] * 4) + (comida[:proteinas] * 4)
    
        	if comida[:fibra] != nil
        	    nrg_value += comida[:fibra] * 2
        	end      
        	
            if comida[:sal] != nil
                nrg_value += comida[:sal] * 6
            end
        end
    	
    	nrg_value/10
    end
end