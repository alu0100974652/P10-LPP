# Implementacion de la clase heredada Plato_herencia

class Plato_herencia < Plato

	attr_reader :valor_energetico_plato_alimentos
	
	include Comparable

	# Metodo initialize
	# @deprecated Metodo para inicializar plato heredado
	# @param parametros del plato más la utilizacion de la funcion super

	def initialize(nombre_plato, conjunto_alimentos, cantidades_engramos, cantidades_totales_engramos)

		super(nombre_plato, conjunto_alimentos, cantidades_engramos, cantidades_totales_engramos)
		@valor_energetico_plato_alimentos = valor_energetico_plato_alimentos
		@valor = valor
		@total_ve = total_ve
		@huella_nutricional = huella_nutricional

	end

	# Metodo Emisiones totales del plato
	# @deprecated Funcion para hallar las emisiones totales del plato
	# @return Devuelve un entero con las emisiones totales del plato
	
	def total_ve
		
		total_ve = 0
		i = 0
		
		while i < conjunto_alimentos.length do
		
			total_ve += conjunto_alimentos[i].gei + total_ve
			i += 1

		end
	
		return total_ve
	end

	# Metodo metros_cuadrados
	# @deprecated Sirve para hallar los metodos cuadrados del plato
	# @param Se le pasa el vector de metros cuadrados de los distintos alimentos que componen el plato
	# @return Devuelve el valor de los metros cuadrados totales del plato

	def metros_cuadrados(x_metros_cuadrados)

		total_mc = 0
		i = 0

		while i < x_metros_cuadrados.length do

			total_mc += x_metros_cuadrados[i] + total_mc

			i += 1

		end 

		return total_mc

	end

	# Metodo valor
	# @deprecated Funcion para hallar el valor energetico del plato heredado
	# @return Retorna el valor energetico total del plato

	def valor

		i = 0
		valor = 0
		while i < conjunto_alimentos.length do

			valor = conjunto_alimentos[i].valor_energetico + valor

			i += 1

		end

		return valor
	end

	# Metodo huella nutricional
	# @deprecated Funcion que halla la huella nutricional
	# @return Devuelve el resultado de la huella_nutricional

	def huella_nutricional

		@huella_energetica

		if @valor <= 670
			@huella_energetica = 1.0
		elsif @valor > 670 && @valor <= 830
			@huella_energetica = 2.0
		else  
			@huella_energetica = 3.0
		end

		@huella_carbono

		if @total_ve <= 800
			@huella_carbono = 1.0
		elsif @total_ve > 800 && @total_ve <= 1200
			@huella_carbono = 2.0
		else 
			@huella_carbono = 3.0
		end

		return (@huella_energetica+@huella_carbono)/2

	end

	# Metodo to_s
	# @deprecated Da la eficiencia energetica formateada

	def to_s

		"Eficiencia energética = #{valor}"
	end

	# Metodo <=> 
	# @deprecated Sirve para comparar la eficiencia energetica entre platos

	def <=>(other)
		return nil unless other.kind_of? Plato_herencia
		@valor <=> other.valor
	end

end
