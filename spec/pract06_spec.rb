RSpec.describe Pract06 do

	before(:all) do

                        @carne_vaca = Alimento.new("Carne de vaca", 21.1, 0.0, 3.1, 50.0, 164.0)
                        @carne_cordero = Alimento.new("Carne de cordero",18.0, 0.0, 17.0, 20.0, 185.0)
                        @camarones = Alimento.new("Camarones (piscifactoría)", 17.6, 1.5, 0.6, 18.0, 2.0,)
                        @chocolate = Alimento.new("Chocolate", 5.3, 47.0, 30.0, 2.3, 3.4)
                        @salmon = Alimento.new("Salmón (piscifactoría)", 19.9, 0.0, 13.6, 6.0, 3.7)
                        @cerdo = Alimento.new("Cerdo",21.5, 0.0, 6.3, 7.6, 11.0)
                        @pollo = Alimento.new("Pollo", 20.6, 0.0, 5.6, 5.7, 7.1)
                        @queso = Alimento.new("Queso", 25.0, 1.3, 33.0, 11.0, 41.0)
                        @cerveza = Alimento.new("Cerveza", 0.5, 3.6, 0.0, 0.24, 0.22)
                        @leche_vaca = Alimento.new("Leche de vaca", 3.3, 4.8, 3.2, 3.2, 8.9)
                        @huevos = Alimento.new("Huevos", 13.0, 1.1, 11.0, 4.2, 5.7)
                        @cafe = Alimento.new("Café", 0.1, 0.0, 0.0, 0.4, 0.3)
                        @tofu = Alimento.new("Tofu", 8.0, 1.9, 4.8, 2.0, 2.2)
                        @lentejas = Alimento.new("Lentejas", 23.5, 52.0, 1.4, 0.4, 3.4)
                        @nuez = Alimento.new("Nuez", 20.0, 21.0, 54.0, 0.3, 7.9)

			@vasca=[@cerdo,@chocolate,@nuez]
			@española=[@cerveza,@huevos,@chocolate]
			@vegana=[@nuez,@tofu,@cafe]
			@locura=[@carne_vaca,@carne_cordero,@cafe]
			@veg=[@leche_vaca,@chocolate,@huevos]


			#LISTA VACIA
			@lista = List.new(nil,nil)

			#LISTA VEGANA
			@lista_vegana = List.new(nil,nil)
			@lista_vegana.insert(@nuez)
			@lista_vegana.insert(@tofu)
			@lista_vegana.insert(@cafe)

			#LISTA ESPAÑOLA
			@lista_española = List.new(nil,nil)
			@lista_española.insert(@cerveza)
			@lista_española.insert(@huevos)
			@lista_española.insert(@chocolate)

			#LISTA VASCA
			@lista_vasca = List.new(nil,nil)
			@lista_vasca.insert(@cerdo)
			@lista_vasca.insert(@chocolate)
			@lista_vasca.insert(@nuez)

			#LISTA LOCURA
			@lista_locura = List.new(nil,nil)
			@lista_locura.insert(@carne_vaca)
			@lista_locura.insert(@carne_cordero)
			@lista_locura.insert(@cafe)

			#LISTA VEGETARIANA
			@lista_vegetariana = List.new(nil,nil)
			@lista_vegetariana.insert(@leche_vaca)
			@lista_vegetariana.insert(@chocolate)
			@lista_vegetariana.insert(@huevos)

			#PLATOS NO HEREDADOS
			@bistecv_huevos = Plato.new("Bistec de vaca con huevos", [@carne_vaca, @huevos], [2.5, 0.2], 270)

			#PLATOS HEREDADOS

			@bistecv_con_huevos = Plato_herencia.new("Bistec de vaca con huevos", [@carne_vaca, @huevos], [2.5, 0.2], 270)
			@pollo_con_queso = Plato_herencia.new("Pollo con queso", [@pollo, @queso], [3.0, 0.6], 360)
			@lentejas_con_salmon = Plato_herencia.new("Lentejas con salmon", [@lentejas, @salmon], [1.5, 2.0], 250)

			#MENUS
			@menu1 = [@bistecv_con_huevos, @lentejas_con_salmon, @pollo_con_queso]


			#PRACT10
			
			@plato_1 = Plato_dsl.new("Hamburguesa") do
				nombre		"Hamburguesa con Huevo"
				alimento	:descripcion => "Carne de Vaca",
						:prote => 21.1,
						:carbo => 0.0,
						:lipidos => 3.1,
						:gases => 50.0,
						:terreno => 164.0,
						:gramos => 100
				alimento	:descripcion => "Huevo",
						:prote => 5.0,
						:carbo => 1.1,
						:lipidos => 2.1,
						:gases => 3.5,
						:terreno => 2.6,
						:gramos => 10
			end
			
			@plato_2 = Plato_dsl.new("Salchipapas") do
				nombre		"Salchipapas"
				alimento	:descripcion => "Papas Fritas",
						:prote => 6.3,
						:carbo => 19.2,
						:lipidos => 2.1,
						:gases => 12.0,
						:terreno => 1.2,
						:gramos => 100
				alimento	:descripcion => "Salchichas",
						:prote => 5.0,
						:carbo => 20.1,
						:lipidos => 4.2,
						:gases => 3.5,
						:terreno => 0.5,
						:gramos => 10
			end
		
			@menu_P10 = Menu.new("Combinado de Hamburguesa") do
				componente 	:plato => "Hamburguesa de la casa",
						:precio => 3.50
				componente	:plato => "Papas fritas con salsa",
						:precio => 2.50
				precio		6.00
			end

                end


#############################################################################################################################################


	describe Alimento do

		context "Crear la clase Alimento Prct06: " do
			it "Hay un nombre para el alimento " do
				expect(@carne_vaca.nombre).to eq("Carne de vaca")
			end

			it "Hay un metodo que devuelve el nombre del alimento" do
				expect(@carne_vaca.giv_nombre(@nombre)).to eq("Carne de vaca")
			end

			it "Existe la cantidad de emisiones de gases de efecto invernadero" do
				expect(@carne_vaca.gei).to eq(50.0)
			end

			it "Existe la cantidad de terreno utilizado en m2año" do
				expect(@carne_vaca.terreno).to eq(164.0)
			end

			it "Existe un metodo para obtener las emisiones de gases de efecto invernadero" do
				expect(@carne_vaca.giv_gei(@gei)).to eq(50.0)
			end

			it "Existe un metodo para obtener el terreno utilizado" do 
				expect(@carne_vaca.giv_terreno(@terreno)).to eq(164.0)
			end

			it "Existe un metodo para obtener el valor energético del alimento" do
				expect(@carne_vaca.valor_energetico).to eq(96.8)
			end

			it "Existe un metodo para dar el alimento formateado" do
				expect(@carne_vaca.to_s).to eq("Nombre: #{@carne_vaca.nombre}, Proteinas: #{@carne_vaca.proteinas}, Hidratos de carbono: #{@carne_vaca.carbohidratos}, Lipidos: #{@carne_vaca.lipidos}, Gases de efecto invernadero: #{@carne_vaca.gei}, Terreno: #{@carne_vaca.terreno}")
			end

			it "Se calcula correctamente el impacto ambiental diario de un hombre 20-39" do
				impactoGEIh = ((@carne_vaca.gei)*2 + (@salmon.gei)*2 + (@lentejas.gei)*2 + (@nuez.gei)*5).round(1)
				boolh = false
				consumoh = ((@carne_vaca.valor_energetico)*2 + (@salmon.valor_energetico)*2 + (@lentejas.valor_energetico)*2 + (@nuez.valor_energetico)*5).round(1)
				ihproteinas = ((@carne_vaca.proteinas)*2 + (@salmon.proteinas)*2 + (@lentejas.proteinas)*2 + (@nuez.proteinas)*5).round(1)

				impactoterrenoh = ((@carne_vaca.terreno)*2 + (@salmon.terreno)*2 + (@lentejas.terreno)*2 + (@nuez.terreno)*5).round(1)

				if ihproteinas >= 54 and 3000 < consumoh then 
					boolh = true
				end
				expect(impactoGEIh).to eq(114.3)
				expect(impactoterrenoh).to eq(381.7)
				expect(boolh).to eq(true)
			end

                        it "Se calcula correctamente el impacto ambiental diario de una mujer 20-39" do
                                impactoGEIm = ((@carne_vaca.gei)*2 + (@salmon.gei)*2 + (@lentejas.gei)*2 + (@nuez.gei)*5).round(1)    
				boolm = false
                                consumom = ((@carne_vaca.valor_energetico)*2 + (@salmon.valor_energetico)*2 + (@lentejas.valor_energetico)*2 + (@nuez.valor_energetico)*5).round(1)
                                improteinas = ((@carne_vaca.proteinas)*2 + (@salmon.proteinas)*2 + (@lentejas.proteinas)*2 + (@nuez.proteinas)*5).round(1)
				impactoterrenom = ((@carne_vaca.terreno)*2 + (@salmon.terreno)*2 + (@lentejas.terreno)*2 + (@nuez.terreno)*5).round(1)   
				if improteinas >= 41 and 2300 < consumom then
					boolm = true
				end       
				expect(impactoGEIm).to eq(114.3)
				expect(impactoterrenom).to eq(381.7)   
				expect(boolm).to eq(true)   
			end 
		end
	end


#############################################################################################################################################

	context List do
		
		it "Prct07-> Se crea un nodo: " do
			node = Node.new(1,nil,nil)
			expect(node.value).to eq(1)
			expect(node.prev).to eq(nil)
			expect(node.next).to eq(nil)
		end

		it "La lista está vacía: " do
			expect(@lista.head).to eq(nil)
			expect(@lista.tail).to eq(nil)
		end

		it "Insertar un elemento en la lista: " do
			@lista.insert(@carne_vaca)
			expect(@lista.head.value).to eq(@carne_vaca)
		end

		it "Insertar varios elementos en la lista: " do
			@lista.insert(@carne_vaca)
			@lista.insert(@salmon)
			@lista.insert(@chocolate)
			@lista.insert(@nuez)
			expect(@lista.head.value.gei).to eq(@carne_vaca.gei)
			expect(@lista.tail.value.gei).to eq(@nuez.gei)
		end

		it "Extraer la cabeza: " do 
			expect(@lista_vegana.extract_head).to eq(@nuez)
		end

		it "Extraer la cola: " do 
			expect(@lista_vegana.extract_tail).to eq(@cafe)
		end

		it "Emisiones diarias de efecto invernadero para cada dieta: " do
			geiespd = @española[0].gei + @española[1].gei + @española[2].gei
			expect(geiespd).to eq(6.74)

			geivasc = @vasca[0].gei + @vasca[1].gei + @vasca[2].gei
			expect(geivasc).to eq(10.2)

			geiveg = @veg[0].gei + @veg[1].gei + @veg[2].gei
			expect(geiveg).to eq(9.7)

			geivegana = @vegana[0].gei + @vegana[1].gei + @vegana[2].gei
			expect(geivegana.round(1)).to eq(2.70)

			geilocura = @locura[0].gei + @locura[1].gei + @locura[2].gei
			expect(geilocura).to eq(70.4)
		end

		it "Emisiones mensuales de efecto invernadero para cada dieta " do

			geiespd = (@española[0].gei + @española[1].gei + @española[2].gei)*31
			expect(geiespd).to eq(208.94)

			geivasc = (@vasca[0].gei + @vasca[1].gei + @vasca[2].gei)*31
			expect(geivasc).to eq(316.2)

			geiveg = (@veg[0].gei + @veg[1].gei + @veg[2].gei)*31
			expect(geiveg).to eq(300.7)

			geivegana = (@vegana[0].gei + @vegana[1].gei + @vegana[2].gei)*31
			expect(geivegana.round(1)).to eq(83.70)

			geilocura = (@locura[0].gei + @locura[1].gei + @locura[2].gei)*31
			expect(geilocura).to eq(2182.4)
		end

		it "Emisiones anuales de efecto invernadero para cada dieta " do

			geiespd = (@española[0].gei + @española[1].gei + @española[2].gei)*365
			expect(geiespd).to eq(2460.1)

			geivasc = (@vasca[0].gei + @vasca[1].gei + @vasca[2].gei)*365
			expect(geivasc.round(1)).to eq(3723.0)

			geiveg = (@veg[0].gei + @veg[1].gei + @veg[2].gei)*365
			expect(geiveg.round(1)).to eq(3540.50)

			geivegana = (@vegana[0].gei + @vegana[1].gei + @vegana[2].gei)*365
			expect(geivegana.round(1)).to eq(985.50)

			geilocura = (@locura[0].gei + @locura[1].gei + @locura[2].gei)*365
			expect(geilocura.round(1)).to eq(25696.0)
		end
	end

#############################################################################################################################################
	

	context Alimento do

		it "Prct08-> Alimento incluye #Comparable " do
			expect(Alimento.ancestors).to include(Comparable)
			expect(Alimento).to respond_to(:<=>)
		end

		it "< de Comparable" do
			#expect(@carne_vaca < @carne_cordero).to eq(true)
			#expect(@nuez < @leche_vaca).to eq(false)
		end

		it "> de Comparable" do
			#expect(@carne_vaca > @carne_cordero).to eq(false)
                        #expect(@nuez > @leche_vaca).to eq(true)
		end

		it "<= de Comparable" do
			#expect(@carne_vaca <= @carne_cordero).to eq(true)
                        #expect(@nuez <= @leche_vaca).to eq(false)
		end

		it ">= de Comparable" do
			#expect(@carne_vaca >= @carne_cordero).to eq(false)
                        #expect(@nuez >= @leche_vaca).to eq(true)
		end

		it "#between de Comparable" do
			#expect(@carne_vaca.between?(@nuez,@lentejas)).to eq(false)
			#expect(@carne_vaca.between?(@cafe,@lentejas)).to eq(true)
		end
	end

	context List do

		it "Lista incluye #Enumerable" do
			expect(List.ancestors).to include(Enumerable)
		end

		it "collect de Enumerable" do
			expect(@lista_locura.collect{|i| i.valor_energetico.round(1)*2}).to eq([193.6, 280.0, 0.8])
		end

		it "select de Enumerable" do
			expect(@lista_locura.select{|i| i.valor_energetico%2==0 }).to eq([@carne_cordero])
                end

		it "max de Enumerable" do
			#expect(@lista_española.max).to eq(@chocolate)
		end

		it "min de Enumerable" do
                        #expect(@lista_vasca.min).to eq(@cerdo)
                end

		it "sort de Enumerable" do
                        #expect(@lista_vegetariana.sort).to eq([@leche_vaca, @huevos, @chocolate])
                end
	end
##############################################################################################################################################
	
	context Plato do

		it "Nombre del alimento" do
			expect(@bistecv_huevos.nombre_plato).to eq("Bistec de vaca con huevos")
		end

		it "Conjunto de alimentos" do 
			expect(@bistecv_huevos.conjunto_alimentos).to eq([@carne_vaca, @huevos])
		end

		it "Conjunto de cantidades de alimentos en gramos" do
			expect(@bistecv_huevos.cantidades_engramos).to eq([2.5, 0.2])
		end

		it "Porcentaje de proteinas: " do
			expect(@bistecv_huevos.porcentaje_proteinas).to eq("20.5%")
		end

		it "Porcentaje de lipidos: " do
			expect(@bistecv_huevos.porcentaje_lipidos).to eq("3.7%")
		end

		it "Porcentaje de hidratos de carbono: " do
			expect(@bistecv_huevos.porcentaje_carbohidratos).to eq("0.1%")
		end

		it "Se calcula el Valor Calórico total: " do
			expect(@bistecv_huevos.valor_calorico_total).to eq(299.5)
		end

		it "Se obtiene el plato formateado: " do
			expect(@bistecv_huevos.to_s).to eq("Plato: #{@bistecv_huevos.nombre_plato}, \nIngredientes: #{@bistecv_huevos.conjunto_alimentos},\nCantidad total del plato: #{@bistecv_huevos.cantidades_totales_engramos}, separados en las siguientes cantidades por alimento #{@bistecv_huevos.cantidades_engramos}")
		end
	end

###########################################################################################################################################################################

	context Plato_herencia do

		it "Calcula el valor de las emisiones del plato " do

			expect(@bistecv_con_huevos.total_ve).to eq(104.2)
		end

		it "Estimación de los metros cuadrados del plato" do

			expect(@bistecv_con_huevos.metros_cuadrados([@carne_vaca.terreno, @huevos.terreno])).to eq(333.7)
		
		end

	
		it "Eficiencia energética formateada: " do

			expect(@bistecv_con_huevos.to_s).to eq("Eficiencia energética = #{@carne_vaca.valor_energetico + @huevos.valor_energetico}")

		end		       

		it "Clase de objeto" do

			expect(@bistecv_con_huevos.class).to eq(Plato_herencia)
			expect(@bistecv_con_huevos.instance_of? Plato_herencia).to eq(true)
			expect(@bistecv_con_huevos).to respond_to('metros_cuadrados')

		end

		it "Jerarquía de objeto" do

			expect(@bistecv_con_huevos.is_a? Plato).to eq(true)
			expect(@bistecv_con_huevos.is_a? Plato_herencia).to eq(true)

		end

		it "Plato_herencia incluye #Comparable " do
			expect(Plato_herencia.ancestors).to include(Comparable)
			expect(Plato_herencia).to respond_to(:<=>)
		end

		it "< de Comparable" do
		        expect(@bistecv_con_huevos < @pollo_con_queso).to eq(true)
		        expect(@pollo_con_queso < @bistecv_con_huevos).to eq(false)
		end

		it "> de Comparable" do
		        expect(@bistecv_con_huevos > @pollo_con_queso).to eq(false)
		        expect(@pollo_con_queso > @bistecv_con_huevos).to eq(true)
		end

		it "<= de Comparable" do
			expect(@bistecv_con_huevos <= @pollo_con_queso).to eq(true)
			expect(@pollo_con_queso <= @bistecv_con_huevos).to eq(false)
		end

		it ">= de Comparable" do
		        expect(@bistecv_con_huevos >= @pollo_con_queso).to eq(false)
		        expect(@pollo_con_queso >= @bistecv_con_huevos).to eq(true)
		end

		it "#between de Comparable" do
		        expect(@bistecv_con_huevos.between?(@pollo_con_queso,@lentejas_con_salmon)).to eq(false)
		        expect(@pollo_con_queso.between?(@bistecv_con_huevos,@lentejas_con_salmon)).to eq(true)
		end
	end

########################################################################################################################################
	
	context "Prct09 -> Menu" do

		it "Creación del menú: " do
			expect(@menu1).to eq([@bistecv_con_huevos, @lentejas_con_salmon, @pollo_con_queso])
		end

		it "Se calcula la huella nutricional de un plato:" do
			expect(@bistecv_con_huevos.huella_nutricional).to eq(1)
		end

		it "Se calcula el máximo de huella nutricional de un menú dietético: " do
			expect(@menu1.max_by {|platos_herencia| platos_herencia.huella_nutricional}).to eq(@lentejas_con_salmon)
		end

		it "Se incrementan los precios del menú dietético según la huella nutricional máxima del plato" do
			precio_inicial = [11.25, 7.35, 5.9]

			plato_con_hu_nutricional_max = @menu1.max_by {|platos_herencia| platos_herencia.huella_nutricional}

			vect_platos_huell_nt = @menu1.map {|menu1| (menu1.huella_nutricional / plato_con_hu_nutricional_max.huella_nutricional).round(2)}


			expect(vect_platos_huell_nt).to eq([0.67, 1.0, 0.67])

			precio_final = [precio_inicial, vect_platos_huell_nt].transpose.map {|x| x.reduce(:+)}

			expect(precio_final).to eq([11.92, 8.35, 6.57])

		end
	end
##############################################################################################################################################
	

	context "Prct10 -> Menus formateados" do 

		it "Prueba de creacion de un plato" do

			@plato = Plato_dsl.new("Hamburguesa") do
				nombre		"Hamburguesa con Huevo"
				alimento	:descripcion => "Carne de Vaca",
						:proteinas => 21.1,
						:carbohidratos => 0.0,
						:lipidos => 3.1,
						:gei => 50.0,
						:terreno => 164.0,
						:gramos => 100

				alimento	:descripcion => "Huevo",
						:protenas => 5.0,
						:carbohidratos => 1.1,
						:lipidos => 2.1,
						:gei => 3.5,
						:terreno => 2.6,
						:gramos => 10
			end
		end

		it "Se genera una presentación formateada del menu :)" do
			expect(@menu_P10.to_s).to eq("Combinado de Hamburguesa = 6.0€\nContiene: \nHamburguesa de la casa = 3.5€\nPapas fritas con salsa = 2.5€\n")
		end
	end
end
