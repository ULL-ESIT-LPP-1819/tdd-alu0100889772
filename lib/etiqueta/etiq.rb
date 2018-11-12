class Etiq

    attr_reader :nombre, :grasa, :saturada, :hidrato, :azucar, :proteina, :sal
    
    def initialize(nombre, grasa, saturada, hidrato, azucar, proteina, sal)
        @nombre, @grasa, @saturada, @hidrato, @azucar, @proteina, @sal = nombre, grasa, saturada, hidrato, azucar, proteina, sal
    end
    
    def to_s
        "#{@nombre}, grasa #{@grasa}g de las cuales saturada #{@saturada}g, hidratos de carbono #{@hidrato}g de los cuales azucares #{@azucar}g, proteinas #{@proteina}g, sal #{@sal}g"
    end
end