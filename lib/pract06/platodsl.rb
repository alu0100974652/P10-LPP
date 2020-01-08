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
	def <=> (otro)
		valor_energetico <=> otro.valor_energetico
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
		nproteinas=0
		aux =@alimentos.head
		auxgramos = @gramos.head
		while(aux!=nil)
			nproteinas += aux.value.proteinas * (auxgramos.value / (aux.value.proteinas+aux.value.lipidos+aux.value.carbohidratos))
			aux = aux.next
			auxgramos = auxgramos.next
		end
		(nproteinas/gramos_totales*100).round(1)
	end

	#Funcion para calcular los gramos de Lipidos del Plato
	def lipidos
		lipidos=0
		aux = @alimentos.head
		auxgramos = @gramos.head
		while(aux!=nil)
			lipidos += aux.value.lipidos * (auxgramos.value/(aux.value.proteinas+aux.value.lipidos+aux.value.carbohidratos))
			aux = aux.next
			auxgramos = auxgramos.next
		end
		(lipidos/gramos_totales*100).round(1)
	end

	#Funcion para calcular los gramos de Hidratos de Carbono del Plato
	def hidratos
		carbo = 0
		aux = @alimentos.head
		auxgramos = @gramos.head
		while(aux!=nil)
			carbo += aux.value.carbo * (auxgramos.value/(aux.value.proteinas+aux.value.lipidos+aux.value.carbohidratos))
			aux = aux.next
			auxgramos = auxgramos.next
  		end
		  (carbo/gramos_totales*100).round(1)
	end

	#Funcion para calcular los gramos totales del Plato
	def gramos_totales
		gramostotales=0
		aux = @gramos.head
		while(aux!=nil)
			gramostotales+= aux.value
			aux = aux.next
		end
		gramostotales.round(1)
	end

	#Funcion Para calcular el Valor energetico del Plato
	def valor_energetico
		valor=0
		aux = @alimentos.head
		auxgramos = @gramos.head
		while(aux!=nil)
			valor += aux.value.valor_energetico * (auxgramos.value/(aux.value.proteinas+aux.value.lipidos+aux.value.carbohidratos))
			aux = aux.next
			auxgramos = auxgramos.next
		end
		valor.round(1)
	end

	#Formateado de la Clase Plato
	def to_s
		output = "Valor Nutricional del plato: #{@nombre}\n"
		output << "Valor energetico: #{valor_energetico}\n"
	      	output << "Valor ambiental: #{huella}\n"	
	end

	#Calculo de la Huella Nutricional
	def huella

		if valor_energetico < 670
			aux1=1
		elsif valor_energetico < 830
			aux1=2
		else
			aux1=3
		end

		if hidratos < 800
			aux2=1
		elsif hidratos < 1200
			aux2=2
		else
			aux2=3
		end
		aux1+aux2/2	
	end
end
