class Alimento


	attr_reader :nombre, :proteinas, :carbohidratos, :lipidos, :gei, :terreno

	include Comparable

	def initialize(nombre, proteinas, carbohidratos, lipidos, gei, terreno)
		@nombre, @proteinas, @carbohidratos, @lipidos, @gei, @terreno = nombre, proteinas, carbohidratos, lipidos, gei, terreno
		@valor_energetico = valor_energetico
	end

	def giv_nombre(nombre)
		return @nombre	
	end

	def giv_gei(gei)
		return @gei
	end

	def giv_terreno(terreno)
		return @terreno
	end

	def valor_energetico
		return ((@proteinas * 4) + (@carbohidratos * 9) + (@lipidos *4)).round(1)
	end

	def to_s
		"Nombre: #{nombre}, Proteinas: #{proteinas}, Hidratos de carbono: #{carbohidratos}, Lipidos: #{lipidos}, Gases de efecto invernadero: #{gei}, Terreno: #{terreno}"
	end

	def <=>(other)
		return nil unless other.kind_of? Alimento
		@valor_energetico <=> other.valor_energetico
	end

end
