#Clase para representar un Menu con DSL
class Menu
	attr_accessor :nombre,:platos,:precio
	def initialize(nombre,&block)
		@nombre = nombre
		@platos = []
		@precios=[]
		@preciototal =0.0
		
		if block_given?
			if block.arity == 1
				yield self
			else
				instance_eval(&block)
			end
		end
	end
	
	def componente(options={})
		@platos << options[:plato]
		@precios << options[:precio]
	end

	def precio(total)
		@preciototal = total
	end

	def to_s
		output = "#{@nombre}"
		output << " = #{@preciototal}€\n"
		output << "Contiene: \n"
		@platos.zip(@precios).each do |x,y|
			output << "#{x} = #{y}€\n"
		end
		output
	end
end
