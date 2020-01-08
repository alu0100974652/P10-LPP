# Creación de la clase List con la estructura Node
#

Node = Struct.new(:value, :next, :prev) #Debe existir un nodo con su dato, su siguiente y su previo

class List
	attr_accessor :head, :nodo_actual,:tail #Debe existir una Lista con su cabeza y su cola
	
	include Enumerable

	# Metodo initialize
	# @param parametros head y tail de la lista
	
        def initialize(head,tail)
          	@head = nil
		@tail = nil
        end
        
	# Se puede insertar un elemento por la cabeza
	# @param value para insertar elementos
	
        def insert(value)
		node = Node.new(value,nil)
		if (@head == nil)
			@head = node
		else
			@tail.next = node
			node.prev = @tail
		end

		@tail=node
        end

	# Metodo extract_head 
	# @deprecated Sirve para la extracción de la cabeza de la lista

	def extract_head
            aux=""
	    if (@head!=nil)
                aux = @head.value
                @head = @head.next
                return aux
            end
        end        

	# Metodo extract_tail
	# @deprecated Sirve para la extracción por la cola de la lista
  
  	def extract_tail
            aux=""
            if(@tail!=nil)
                aux = @tail.value
                @tail = @tail.prev
                return aux
            end
        end

	# Metodo each
	# @deprecated Sirve para recorrer la lista dando el valor del nodo

	def each
	    node = head
            while (node!=nil)
        	    yield node.value
        	    node = node.next
            end
        end
end
