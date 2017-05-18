file = File.open("notas.csv", "r")
data = file.readlines
file.close
opcion = 0
contador = 0
def aprovado (nota)
	file = File.open("notas.csv", "r")
	data = file.readlines
	puts "=================================="
	data.each do |valor|
	arreglo = valor.split(", ")
	nombre = arreglo [0]
	promedio =  arreglo[1].to_f + arreglo[2].to_f + arreglo[3].to_f + arreglo[4].to_f + arreglo[5].to_f
	promedio = promedio / 5.0
		if promedio < nota
			puts "El reprobado es #{nombre} con el promedio #{promedio}"
		end
	end
	puts "=================================="
end

while opcion != 4
	puts "1.-Se creara un archivo con la notas de cada alumno"
	puts "2.-Inasistencias totales "
	puts "3.-Alumnos Aprovados"
	puts "4.-Salir"
	print "ingrese opcion "
	opcion = gets.chomp.to_i

	if opcion == 1
		data.each do |valor|
			arreglo = valor.split(", ")
			nombre = arreglo [0]
			promedio =  arreglo[1].to_f + arreglo[2].to_f + arreglo[3].to_f + arreglo[4].to_f + arreglo[5].to_f
			promedio = promedio / 5.0
			file = File.open("#{nombre}.txt", "a")
			file.puts ("El promedio de #{nombre} "+promedio.to_s)
			file.close
		end
	end
	
	if opcion == 2
		puts "=================================="
		data.each do |valor|
			arr = valor.split(", ")
			arr2 = []
			cont = 0
			arr.each do |x|
					if x.chomp == "A"
						arr2.push(cont)
					end
					cont += 1
			end
				arr2.each do |numeroprueba|
						puts "El alumno #{arr[0]} falto en la prueba #{numeroprueba}"
				end
		end
		puts "=================================="
		end
	
	if opcion == 3
	puts "Con que promedio el alumno pasa el curso" 
	notapdomedio = gets.to_i	
		if notapdomedio == 0
			aprovado(5)
		end
		
		if notapdomedio > 0
			aprovado(notapdomedio)		
		end
	end

		if opcion > 4
			puts "=========opcion no valida========="
		end	
	

end


