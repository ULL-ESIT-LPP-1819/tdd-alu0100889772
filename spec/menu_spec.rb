require "spec_helper"

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
        
        @menu1 = Menu.new(@persona1)
        @menu1.insert_comida(Etiq.new("Queso",0.1,0.09,3.5,3.5,8.0,0.1))
        @menu1.insert_comida(Etiq.new("Spaghetti",1.2,0.2,57.6,2.6,9.2,0.01))
        @menu1.insert_comida(Etiq.new("Cerelaes",0.1,0.09,3.5,3.5,8.0,0.1))
        @menu1.insert_comida(Etiq.new("Leche",0.2,0.19,4.5,4.5,9.0,0.2))
        @menu1.insert_comida(Etiq.new("Carne",10.0,9.0,4.0,4.0,6.0,0.5))
        
        @menu2 = Menu.new(@persona2)
        @menu2.insert_comida(Etiq.new("Queso",0.1,0.09,3.5,3.5,8.0,0.1))
        @menu2.insert_comida(Etiq.new("Spaghetti",1.2,0.2,57.6,2.6,9.2,0.01))
        @menu2.insert_comida(Etiq.new("Cerelaes",0.1,0.09,3.5,3.5,8.0,0.1))
        @menu2.insert_comida(Etiq.new("Leche",0.2,0.19,4.5,4.5,9.0,0.2))
        @menu2.insert_comida(Etiq.new("Carne",10.0,9.0,4.0,4.0,6.0,0.5))
        
        @menu3 = Menu.new(@persona1)
        @menu3.insert_comida(Etiq.new("Queso",0.1,0.09,3.5,3.5,8.0,0.1))
        @menu3.insert_comida(Etiq.new("Spaghetti",1.2,0.2,57.6,2.6,9.2,0.01))
        @menu3.insert_comida(Etiq.new("Cerelaes",0.1,0.09,3.5,3.5,8.0,0.1))
        @menu3.insert_comida(Etiq.new("Leche",0.2,0.19,4.5,4.5,9.0,0.2))
        @menu3.insert_comida(Etiq.new("Carne",10.0,9.0,4.0,4.0,6.0,0.5))
        
        @menu4 = Menu.new(@persona4)
        @menu4.insert_comida(Etiq.new("Queso",0.1,0.09,3.5,3.5,8.0,0.1))
        @menu4.insert_comida(Etiq.new("Spaghetti",1.2,0.2,57.6,2.6,9.2,0.01))
        @menu4.insert_comida(Etiq.new("Cerelaes",0.1,0.09,3.5,3.5,8.0,0.1))
        @menu4.insert_comida(Etiq.new("Leche",0.2,0.19,4.5,4.5,9.0,0.2))
        @menu4.insert_comida(Etiq.new("Carne",10.0,9.0,4.0,4.0,6.0,0.5))
        
        @menu5 = Menu.new(@persona5)
        @menu5.insert_comida(Etiq.new("Queso",0.1,0.09,3.5,3.5,8.0,0.1))
        @menu5.insert_comida(Etiq.new("Spaghetti",1.2,0.2,57.6,2.6,9.2,0.01))
        @menu5.insert_comida(Etiq.new("Cerelaes",0.1,0.09,3.5,3.5,8.0,0.1))
        @menu5.insert_comida(Etiq.new("Leche",0.2,0.19,4.5,4.5,9.0,0.2))
        @menu5.insert_comida(Etiq.new("Carne",10.0,9.0,4.0,4.0,6.0,0.5))
        
        @menu6 = Menu.new(@persona1)
        @menu6.insert_comida(Etiq.new("Queso",0.1,0.09,3.5,3.5,8.0,0.1))
        @menu6.insert_comida(Etiq.new("Spaghetti",1.2,0.2,57.6,2.6,9.2,0.01))
        @menu6.insert_comida(Etiq.new("Cerelaes",0.1,0.09,3.5,3.5,8.0,0.1))
        @menu6.insert_comida(Etiq.new("Leche",0.2,0.19,4.5,4.5,9.0,0.2))
        @menu6.insert_comida(Etiq.new("Carne",10.0,9.0,4.0,4.0,6.0,0.5))
        
        @menu7 = Menu.new(@persona7)
        @menu7.insert_comida(Etiq.new("Queso",0.1,0.09,3.5,3.5,8.0,0.1))
        @menu7.insert_comida(Etiq.new("Spaghetti",1.2,0.2,57.6,2.6,9.2,0.01))
        @menu7.insert_comida(Etiq.new("Cerelaes",0.1,0.09,3.5,3.5,8.0,0.1))
        @menu7.insert_comida(Etiq.new("Leche",0.2,0.19,4.5,4.5,9.0,0.2))
        @menu7.insert_comida(Etiq.new("Carne",10.0,9.0,4.0,4.0,6.0,0.5))
        
        @menu8 = Menu.new(@persona1)
        @menu8.insert_comida(Etiq.new("Queso",0.1,0.09,3.5,3.5,8.0,0.1))
        @menu8.insert_comida(Etiq.new("Spaghetti",1.2,0.2,57.6,2.6,9.2,0.01))
        @menu8.insert_comida(Etiq.new("Cerelaes",0.1,0.09,3.5,3.5,8.0,0.1))
        @menu8.insert_comida(Etiq.new("Leche",0.2,0.19,4.5,4.5,9.0,0.2))
        @menu8.insert_comida(Etiq.new("Carne",10.0,9.0,4.0,4.0,6.0,0.5))
    
        @menu9 = Menu.new(@persona9)
        @menu9.insert_comida(Etiq.new("Queso",0.1,0.09,3.5,3.5,8.0,0.1))
        @menu9.insert_comida(Etiq.new("Spaghetti",1.2,0.2,57.6,2.6,9.2,0.01))
        @menu9.insert_comida(Etiq.new("Cerelaes",0.1,0.09,3.5,3.5,8.0,0.1))
        @menu9.insert_comida(Etiq.new("Leche",0.2,0.19,4.5,4.5,9.0,0.2))
        @menu9.insert_comida(Etiq.new("Carne",10.0,9.0,4.0,4.0,6.0,0.5))
    
        @menu10 = Menu.new(@persona1)
        @menu10.insert_comida(Etiq.new("Queso",0.1,0.09,3.5,3.5,8.0,0.1))
        @menu10.insert_comida(Etiq.new("Spaghetti",1.2,0.2,57.6,2.6,9.2,0.01))
        @menu10.insert_comida(Etiq.new("Cerelaes",0.1,0.09,3.5,3.5,8.0,0.1))
        @menu10.insert_comida(Etiq.new("Leche",0.2,0.19,4.5,4.5,9.0,0.2))
        @menu10.insert_comida(Etiq.new("Carne",10.0,9.0,4.0,4.0,6.0,0.5))
        
        @array_menus=[@menu1,@menu2,@menu3,@menu4,@menu5,@menu6,@menu7,@menu8,@menu9,@menu10]
        
        @lista_menus=Node.new
        @lista_menus.push_tail(@persona1)
        @lista_menus.push_tail(@persona2)
        @lista_menus.push_tail(@persona3)
        @lista_menus.push_tail(@persona4)
        @lista_menus.push_tail(@persona5)
        @lista_menus.push_tail(@persona6)
        @lista_menus.push_tail(@persona7)
        @lista_menus.push_tail(@persona8)
        @lista_menus.push_tail(@persona9)
        @lista_menus.push_tail(@persona10)
    end
    
    it "Se verifican los menus correctamente" do
    	expect(@array_menus.collect{|x| x.verificar}).to be == [true,false,true,false,false,true,false,true,false,true]
    end

    
end
    