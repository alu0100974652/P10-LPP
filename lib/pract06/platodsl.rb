#Clase Para representar un Plato con una Lista de Alimento y una Lista de los gramos
class Plato_dsl
	#Incluimos el modulo Comparable para poder comparar Plato
	include Comparable

	def initialize(nombre_plato, &block)

		@nombre_plato=nombre_plato
		@alimentos = List.new(0,0)
		@gramos = List.new(0,0)

		if block_given?
			instance_eval(&block)
		end
	end
	
	#Funcion attr_reader para acceder a los atributos
	attr_accessor :nombre,:alimentos,:gramos

	def nombre(otro_nombre)
		@nombre_plato = otro_nombre
	end

	def alimento(options ={})
		aux = Alimento.new(options[:descripcion],options[:prote],options[:carbohidratos],options[:lipidos],options[:gases],options[:terreno])
		@alimentos.insert(aux)
		@gramos.insert(options[:gramos])
	end
end
