#Clase Para representar un Plato con una Lista de Alimento y una Lista de los gramos
class Plato_dsl
	#Incluimos el modulo Comparable para poder comparar Plato
	include Comparable

	#El constructor de la clase Plato
	def initialize(nombre, &block)
		#Nombre del Plato
		@nombre=nombre
		#Lista de Alimento que contiene el Plato
		@alimentos = List.new(0,0)
		#Lista de Los gramos de cada Alimento
		@gramos = List.new(0,0)

		if block_given?
			if block.arity == 1
				yield self
			else
				instance_eval(&block)
			end
		end
	end
	
	#Funcion attr_reader para acceder a los atributos
	attr_accessor :nombre,:alimentos,:gramos

	#Funcion para comparar entre Plato
	def <=> (other)

		valor_energetico <=> other.valor_energetico

	end

	def titulo(otro_nombre)

		@nombre = otro_nombre

	end

	def alimento(options ={})

		aux = Alimento.new(options[:descripcion],options[:prote],options[:carbohidratos],options[:lipidos],options[:gases],options[:terreno])
		@alimentos.insert(aux)
		@gramos.insert(options[:gramos])

	end

	#Funcion para calcular los gramos de Proteinas del Plato
	def proteinas

		num_proteinas = 0
		aux_alimentos = @alimentos.head
		aux_gramos = @gramos.head

		while(aux_alimentos!=nil)
			num_proteinas += aux_alimentos.value.proteinas * (aux_gramos.value / (aux_alimentos.value.proteinas+aux_alimentos.value.lipidos+aux_alimentos.value.carbohidratos))
			aux_alimentos = aux_alimentos.next
			aux_gramos = aux_gramos.next
		end

		(num_proteinas/gramos_totales*100).round(1)
	end

	#Funcion para calcular los gramos de Lipidos del Plato
	def lipidos

		lipidos = 0
		aux_alimentos = @alimentos.head
		aux_gramos = @gramos.head
		
		while(aux!=nil)
			lipidos += aux_alimentos.value.lipidos * (aux_gramos.value/(aux_alimentos.value.proteinas+aux_alimentos.value.lipidos+aux.value.carbohidratos))
			aux_alimentos = aux_alimentos.next
			aux_gramos = aux_gramos.next
		end

		(lipidos/gramos_totales*100).round(1)
	end

	#Funcion para calcular los gramos de Hidratos de Carbono del Plato
	def hidratos

		carbo = 0
		aux_alimentos = @alimentos.head
		aux_gramos = @gramos.head

		while(aux!=nil)
			carbo += aux_alimentos.value.carbohidratos * (aux_gramos.value/(aux_alimentos.value.proteinas+aux_alimentos.value.lipidos+aux_alimentos.value.carbohidratos))
			aux_alimentos = aux_alimentos.next
			aux_gramos = aux_gramos.next
  		end

		  (carbo/gramos_totales*100).round(1)
	end

	#Funcion para calcular los gramos totales del Plato
	def gramos_totales

		gramostotales=0
		aux_gramos = @gramos.head
		
		while(aux!=nil)
			gramostotales+= aux.value
			aux_gramos = aux_gramos.next
		end

		gramostotales.round(1)

	end

	#Funcion Para calcular el Valor energetico del Plato
	def valor_energetico

		valor=0
		aux_alimentos = @alimentos.head
		aux_gramos = @gramos.head
		
		while(aux!=nil)
			valor += aux_alimentos.value.valor_energetico * (aux_gramos.value/(aux_alimentos.value.proteinas+aux_alimentos.value.lipidos+aux_alimentos.value.carbohidratos))
			aux_alimentos = aux.next
			aux_gramos = auxgramos.next
		
		end
		valor.round(1)
	end

	#Formateado de la Clase Plato
	def to_s

		"Valor Nutricional del plato: #{@nombre}\nValor energetico: #{valor_energetico}\nValor ambiental: #{huella}\n"	

	end

	#Calculo de la Huella Nutricional
	def huella

		if valor_energetico < 670

			indice_impacto_e=1
		
		elsif valor_energetico < 830
		
			indice_impacto_e=2
		
		else
			indice_impacto_e=3
		end

		if hidratos < 800

			indice_impacto_h=1

		elsif hidratos < 1200

			indice_impacto_h=2

		else

			indice_impacto_h=3

		end

		indice_impacto_e+indice_impacto_h/2	
	end
end
