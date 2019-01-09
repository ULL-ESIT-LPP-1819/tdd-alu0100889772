require "spec_helper"
require 'benchmark'

RSpec.describe Etiqueta do
  
    before :each do
        @persona1 = Individuo.new(66.5,1.40,60,1,80.0,100.0)
        @persona2 = Individuo.new(90.0,1.70,55,0,100.0,115.0)
        @persona3 = Individuo.new(78.0,1.70,55,1,100.0,115.0)
        @persona4 = Individuo.new(60.0,1.30,55,0,100.0,115.0)
        @persona5 = Individuo.new(90.0,1.60,55,1,100.0,115.0)
        @persona6 = Individuo.new(95.0,1.70,59,0,110.0,115.0)
        @persona7 = Individuo.new(92.0,1.80,57,1,105.0,110.0)
        @persona8 = Individuo.new(99.0,1.84,55,0,100.0,115.0)
        @persona9 = Individuo.new(90.0,1.60,55,1,100.0,115.0)
        @persona10 = Individuo.new(90.0,1.70,55,0,110.0,115.0)
        
        @menu1 = Menu_antiguo.new(@persona1)
        @menu1.insert_comida(Etiq.new("Queso",0.1,0.09,3.5,3.5,8.0,0.1))
        @menu1.insert_comida(Etiq.new("Spaghetti",1.2,0.2,57.6,2.6,9.2,0.01))
        @menu1.insert_comida(Etiq.new("Cerelaes",0.1,0.09,3.5,3.5,8.0,0.1))
        @menu1.insert_comida(Etiq.new("Leche",0.2,0.19,4.5,4.5,9.0,0.2))
        @menu1.insert_comida(Etiq.new("Carne",10.0,9.0,4.0,4.0,6.0,0.5))
        
        @menu2 = Menu_antiguo.new(@persona2)
        @menu2.insert_comida(Etiq.new("Queso",0.1,0.09,3.5,3.5,8.0,0.1))
        @menu2.insert_comida(Etiq.new("Spaghetti",1.2,0.2,57.6,2.6,9.2,0.01))
        @menu2.insert_comida(Etiq.new("Cerelaes",0.1,0.09,3.5,3.5,8.0,0.1))
        @menu2.insert_comida(Etiq.new("Leche",0.2,0.19,4.5,4.5,9.0,0.2))
        @menu2.insert_comida(Etiq.new("Carne",10.0,9.0,4.0,4.0,6.0,0.5))
        
        @menu3 = Menu_antiguo.new(@persona1)
        @menu3.insert_comida(Etiq.new("Queso",0.1,0.09,3.5,3.5,8.0,0.1))
        @menu3.insert_comida(Etiq.new("Spaghetti",1.2,0.2,57.6,2.6,9.2,0.01))
        @menu3.insert_comida(Etiq.new("Cerelaes",0.1,0.09,3.5,3.5,8.0,0.1))
        @menu3.insert_comida(Etiq.new("Leche",0.2,0.19,4.5,4.5,9.0,0.2))
        @menu3.insert_comida(Etiq.new("Carne",10.0,9.0,4.0,4.0,6.0,0.5))
        
        @menu4 = Menu_antiguo.new(@persona4)
        @menu4.insert_comida(Etiq.new("Queso",0.1,0.09,3.5,3.5,8.0,0.1))
        @menu4.insert_comida(Etiq.new("Spaghetti",1.2,0.2,57.6,2.6,9.2,0.01))
        @menu4.insert_comida(Etiq.new("Cerelaes",0.1,0.09,3.5,3.5,8.0,0.1))
        @menu4.insert_comida(Etiq.new("Leche",0.2,0.19,4.5,4.5,9.0,0.2))
        @menu4.insert_comida(Etiq.new("Carne",10.0,9.0,4.0,4.0,6.0,0.5))
        
        @menu5 = Menu_antiguo.new(@persona5)
        @menu5.insert_comida(Etiq.new("Queso",0.1,0.09,3.5,3.5,8.0,0.1))
        @menu5.insert_comida(Etiq.new("Spaghetti",1.2,0.2,57.6,2.6,9.2,0.01))
        @menu5.insert_comida(Etiq.new("Cerelaes",0.1,0.09,3.5,3.5,8.0,0.1))
        @menu5.insert_comida(Etiq.new("Leche",0.2,0.19,4.5,4.5,9.0,0.2))
        @menu5.insert_comida(Etiq.new("Carne",10.0,9.0,4.0,4.0,6.0,0.5))
        
        @menu6 = Menu_antiguo.new(@persona1)
        @menu6.insert_comida(Etiq.new("Queso",0.1,0.09,3.5,3.5,8.0,0.1))
        @menu6.insert_comida(Etiq.new("Spaghetti",1.2,0.2,57.6,2.6,9.2,0.01))
        @menu6.insert_comida(Etiq.new("Cerelaes",0.1,0.09,3.5,3.5,8.0,0.1))
        @menu6.insert_comida(Etiq.new("Leche",0.2,0.19,4.5,4.5,9.0,0.2))
        @menu6.insert_comida(Etiq.new("Carne",10.0,9.0,4.0,4.0,6.0,0.5))
        
        @menu7 = Menu_antiguo.new(@persona7)
        @menu7.insert_comida(Etiq.new("Queso",0.1,0.09,3.5,3.5,8.0,0.1))
        @menu7.insert_comida(Etiq.new("Spaghetti",1.2,0.2,57.6,2.6,9.2,0.01))
        @menu7.insert_comida(Etiq.new("Cerelaes",0.1,0.09,3.5,3.5,8.0,0.1))
        @menu7.insert_comida(Etiq.new("Leche",0.2,0.19,4.5,4.5,9.0,0.2))
        @menu7.insert_comida(Etiq.new("Carne",10.0,9.0,4.0,4.0,6.0,0.5))
        
        @menu8 = Menu_antiguo.new(@persona1)
        @menu8.insert_comida(Etiq.new("Queso",0.1,0.09,3.5,3.5,8.0,0.1))
        @menu8.insert_comida(Etiq.new("Spaghetti",1.2,0.2,57.6,2.6,9.2,0.01))
        @menu8.insert_comida(Etiq.new("Cerelaes",0.1,0.09,3.5,3.5,8.0,0.1))
        @menu8.insert_comida(Etiq.new("Leche",0.2,0.19,4.5,4.5,9.0,0.2))
        @menu8.insert_comida(Etiq.new("Carne",10.0,9.0,4.0,4.0,6.0,0.5))
    
        @menu9 = Menu_antiguo.new(@persona9)
        @menu9.insert_comida(Etiq.new("Queso",0.1,0.09,3.5,3.5,8.0,0.1))
        @menu9.insert_comida(Etiq.new("Spaghetti",1.2,0.2,57.6,2.6,9.2,0.01))
        @menu9.insert_comida(Etiq.new("Cerelaes",0.1,0.09,3.5,3.5,8.0,0.1))
        @menu9.insert_comida(Etiq.new("Leche",0.2,0.19,4.5,4.5,9.0,0.2))
        @menu9.insert_comida(Etiq.new("Carne",10.0,9.0,4.0,4.0,6.0,0.5))
    
        @menu10 = Menu_antiguo.new(@persona1)
        @menu10.insert_comida(Etiq.new("Queso",0.1,0.09,3.5,3.5,8.0,0.1))
        @menu10.insert_comida(Etiq.new("Spaghetti",1.2,0.2,57.6,2.6,9.2,0.01))
        @menu10.insert_comida(Etiq.new("Cerelaes",0.1,0.09,3.5,3.5,8.0,0.1))
        @menu10.insert_comida(Etiq.new("Leche",0.2,0.19,4.5,4.5,9.0,0.2))
        @menu10.insert_comida(Etiq.new("Carne",10.0,9.0,4.0,4.0,6.0,0.5))
        
        @array_menus=[@menu1,@menu2,@menu3,@menu4,@menu5,@menu6,@menu7,@menu8,@menu9,@menu10]
        
        @lista_personas=Node.new
        @lista_personas.push_tail(@persona1)
        @lista_personas.push_tail(@persona2)
        @lista_personas.push_tail(@persona3)
        @lista_personas.push_tail(@persona4)
        @lista_personas.push_tail(@persona5)
        @lista_personas.push_tail(@persona6)
        @lista_personas.push_tail(@persona7)
        @lista_personas.push_tail(@persona8)
        @lista_personas.push_tail(@persona9)
        @lista_personas.push_tail(@persona10)
    end
    
    it "los menús funcionan" do
    	expect(@array_menus.collect{|x| x.verificar}).to be == [true,false,true,false,false,true,false,true,false,true]
    end
    
    Benchmark.bm do |x|
    
        it "ordena array con for" do

            array_copy = @array_menus.dup
            @array_resul = []
            aux=0
            
            x.report("for array:"){
                for i in 0..@array_menus.size-1
                    for j in 0..array_copy.size-1
                        if array_copy[j].nrg_value < array_copy[aux].nrg_value
                            aux=j
                        end
                    end
                    @array_resul.push(array_copy[aux])
                    array_copy.delete_at(aux)
                    aux=0
                end
            }    
                expect(@array_resul).to eq (@array_menus.sort{ |a, b| a.nrg_value <=> b.nrg_value})
            
            
        end
        
        it "ordena lista con for" do
            
            
            
            array_copy = @lista_personas.to_array
            @array_resul = []
            aux=0
            
            x.report("for lista:"){
                for i in 0..@lista_personas.size-1
                    for j in 0..array_copy.size-1
                        if array_copy[j].gasto_nrg_global(2) < array_copy[aux].gasto_nrg_global(2)
                            aux=j
                        end
                    end
                    @array_resul.push(array_copy[aux])
                    array_copy.delete_at(aux)
                    aux=0
                end
            }
            expect(@array_resul).to eq (@lista_personas.sort{ |a, b| a.gasto_nrg_global(2) <=> b.gasto_nrg_global(2)})
            
            
            
        end
        
        it "ordena array con each" do
            #x.report("each array:"){
                #array_copy = @array_menus.dup
                #array_copy.each{ |x| array_copy.each{ |y| array_copy[x],lista[y] = array_copy[y],dll_copy[x] if array_copy[x].nrg_value < array_copy[y].nrg_value}}
            #}
        end
        
        it "ordena array con sort" do
            x.report("sort array:"){
                @array_resul=@array_menus.sort{ |a, b| a.nrg_value <=> b.nrg_value}
            }
            for i in 0..@array_resul.size-2
                expect(@array_resul[i].nrg_value).to be <= (@array_resul[i+1].nrg_value)
            end
            
        end
        
        it "ordena lista con sort" do
            x.report("sort lista:"){
                @array_resul=@lista_personas.sort{ |a, b| a.gasto_nrg_global(2) <=> b.gasto_nrg_global(2)}
            }
            for i in 0..@array_resul.size-2
                expect(@array_resul[i].gasto_nrg_global(2)).to be <= (@array_resul[i+1].gasto_nrg_global(2))
            end
            
        end
    end
    
    it "crea menu nuevo" do
        
        menu = Menu.new("Lunes") do
            titulo      "Bajo en calorías"
            ingesta     :min => 30, :max => 35
            desayuno    :descripcion => "Pan de trigo integral",
                        :porcion => "1 rodaja",
                        :gramos => 100,
                        :grasas => 3.3,
                        :carbohidratos => 54.0,
                        :proteinas => 11.0,
                        :fibra => 2.3,
                        :sal => 0.06
            desayuno    :descripcion => "Actimel",
                        :porcion => "1 porción",
                        :gramos => 100,
                        :grasas => 3.4,
                        :carbohidratos => 4.4,
                        :proteinas => 3.6,
                        :sal => 0.05
            almuerzo    :description => "Arroz",
                        :porcion => "1 taza",
                        :gramos => 100,
                        :grasas => 0.9,
                        :carbohidratos => 81.6,
                        :proteinas => 6.67,
                        :fibra => 1.4,
                        :sal => 0.04
            almuerzo    "Lentejas",
                        :porcion => "1/2 cucharón",
                        :grasas => 0.4,
                        :carbohidratos => 20.0,
                        :proteinas => 9.0,
                        :fibra => 8.0,
                        :sal => 0.02
            almuerzo    :descripcion => "Naranja",
                        :porcion => "1 pieza",
                        :gramos => 100,
                        :grasas => 0.12,
                        :carbohidratos => 11.75,
                        :proteinas => 0.94,
                        :fibra => 2.4
            cena        :descripcion => "Leche entera hacendado",
                        :porcion => "1 vaso",
                        :gramos => 100,
                        :grasas => 3.6,
                        :carbohidratos => 4.6,
                        :proteinas => 3.1,
                        :sal => 0.13
        end

        
    end
    
    it "saca to_s" do
        menu = Menu.new("Lunes") do
            titulo      "Bajo en calorías"
            ingesta     :min => 30, :max => 35
            desayuno    :descripcion => "Pan de trigo integral",
                        :porcion => "1 rodaja",
                        :gramos => 100,
                        :grasas => 3.3,
                        :carbohidratos => 54.0,
                        :proteinas => 11.0,
                        :fibra => 2.3,
                        :sal => 0.06
            desayuno    :descripcion => "Actimel",
                        :porcion => "1 porción",
                        :gramos => 100,
                        :grasas => 3.4,
                        :carbohidratos => 4.4,
                        :proteinas => 3.6,
                        :sal => 0.05
            almuerzo    :descripcion => "Arroz",
                        :porcion => "1 taza",
                        :gramos => 100,
                        :grasas => 0.9,
                        :carbohidratos => 81.6,
                        :proteinas => 6.67,
                        :fibra => 1.4,
                        :sal => 0.04
            almuerzo    :descripcion => "Lentejas",
                        :porcion => "1/2 cucharón",
                        :grasas => 0.4,
                        :carbohidratos => 20.0,
                        :proteinas => 9.0,
                        :fibra => 8.0,
                        :sal => 0.02
            almuerzo    :descripcion => "Naranja",
                        :porcion => "1 pieza",
                        :gramos => 100,
                        :grasas => 0.12,
                        :carbohidratos => 11.75,
                        :proteinas => 0.94,
                        :fibra => 2.4
            cena        :descripcion => "Leche entera hacendado",
                        :porcion => "1 vaso",
                        :gramos => 100,
                        :grasas => 3.6,
                        :carbohidratos => 4.6,
                        :proteinas => 3.1,
                        :sal => 0.13
        end
        
        expect(menu.to_s).to eq("
\tLunes\t\t\t\tComposición nutricional
\t=============================================================================================
\t\t\t\t\tgrasas\tcarbohidratos\tproteínas\tfibra\tsal\tvalor energético
\tDesayuno
\t\"Pan de trigo integral\"\t\t3.30\t54.00\t\t11.00\t\t2.30\t0.06\t28.97
\t\"Actimel\"\t\t\t3.40\t4.40\t\t3.60\t\t0.00\t0.05\t6.26
\tAlmuerzo
\t\"Arroz\"\t\t\t\t0.90\t81.60\t\t6.67\t\t1.40\t0.04\t36,12
\t\"Lentejas\"\t\t\t0.40\t20.00\t\t9.00\t\t8.00\t0.02\t11,96
\t\"Naranja\"\t\t\t0.12\t11.75\t\t0.94\t\t2.40\t0.00\t5,18
\tCena
\t\"Leche entera hacendado\"\t3.60\t4.60\t\t3.10\t\t0.00\t0.13\t6,32
\tValor energético total\t\t94,81")


end
    
    
    
end
    