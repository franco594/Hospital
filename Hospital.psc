
// Este subproceso imprime una interfaz y permite al usuario elegir que funci�n utilizar
SubProceso  menu
	// En esta variable (num_1) guardaremos el numero ingresado por el usuario
	Definir num_1,i Como Entero;
	// Definimos una variable (swicht) para usar como condicion de un ciclo mientras
	Definir swicht Como Logico;
	// Definimos una variable (numeroPaciente) qur usaremos para mantener un conteo de los pacientes ingresados
	Definir numeroPaciente como Entero;
	// Definimos una variable (datosPacientes), ser� una matriz para guardar datos del tipo Cadena
	Definir datosPacientes como Cadena;
	// Le damos un tama�o a la matriz, las columnas representaran los tipos de datos y cada fila a un paciente
	Dimension datosPacientes[999,7];
	
	// Usaremos este ciclo para limpiar cada fila de la columna "DNI"
	Para i <- 0 Hasta 998 Hacer
		datosPacientes[i,6] <- "";
	FinPara
	
	// Inicializamos la variable (n�meroPaciente) con valor cero
	numeroPaciente <- 0;
	// Inicializamos la variable (swicht) como Falsa
	swicht <- Falso;
	
	// Mientras el usuario no ingrese la opci�n terminar se imprimira el menu
	Mientras swicht = Falso Hacer
		Escribir "";
		Escribir "                            ****************    ";
		Escribir "                            SISTEMA HOSPITAL    ";
		Escribir "                            ****************    ";
		Escribir "";
		Escribir "                         1) Ingresar paciente";
		Escribir "                         2) Buscar paciente";
		Escribir "                         3) Modificar paciente";
		Escribir "                         4) Eliminar paciente";
		Escribir "                         5) Salir";
		Escribir "";
		Escribir "                           Elija una opci�n: " Sin Saltar;
		leer num_1;
		// Si el n�mero ingresado es no es v�lido
		Si num_1 <> 1 Y num_1 <> 2 Y num_1 <> 3 Y num_1 <> 4 Y num_1 <> 5 Entonces
			Escribir "Ingrese una opci�n v�lida.";
			Escribir "";
		Sino
			// Si ingresa 1)
			Si num_1 = 1 Entonces
				// Se llama el subproceso ingresar
				ingresar(datosPacientes,numeroPaciente);
			SiNo
				// Si ingresa 2)
				Si num_1 = 2 Entonces
					// Se llama el subproceso buscar
					buscar(datosPacientes,numeroPaciente);
				SiNo
					// Si ingresa 3
					Si num_1 = 3 Entonces
						// Se llama el subproceso modificar
						modificar;
					SiNo
						Si num_1 = 4 Entonces
							// Se llama el subproceso eliminar
							Eliminar;
						SiNo
							Si num_1 = 5 Entonces
								// Termina el programa 
								swicht <- Verdadero;
								Limpiar Pantalla;
							FinSi
						FinSi	
					FinSi
				FinSi
			FinSi
		FinSi
	FinMientras
FinSubProceso


// El subproceso ingresar recibe la matriz de datos del paciente y el n�mero de paciente por referencia
SubProceso ingresar(datosPacientes Por Referencia,numeroPaciente Por Referencia )
	
	Definir num_1,num_2,i,long,dni,contador Como Entero;
	Definir tipoSangre como Cadena;
	Definir swichtSangre Como Logico;
	Definir especialidad como Cadena;
	Definir swichtEspecialidad Como Logico;
	Definir swichtDni Como Logico;
	Definir swichtDni_2 Como Logico;
	
	// En el arreglo (tipoSangre) se guardaran los tips de sangre posibles
	Dimension tipoSangre[8];
	tipoSangre[0] <- "a+";
	tipoSangre[1] <- "b+";
	tipoSangre[2] <- "ab+";
	tipoSangre[3] <- "0+";
	tipoSangre[4] <- "a-";
	tipoSangre[5] <- "b-";
	tipoSangre[6] <- "ab-";
	tipoSangre[7] <- "0-";
	
	// En el arreglo (especialidad) se guardaran las especialidades disponibles
	Dimension especialidad[7];
	especialidad[0] <- "Cardiolog�a";
	especialidad[1] <- "Traumatolog�a";
	especialidad[2] <- "Odontolog�a";
	especialidad[3] <- "Pediatr�a";
	especialidad[4] <- "Cl�nica";
	especialidad[5] <- "Radiolog�a";
	especialidad[6] <- "Dermatolog�a";
	
	
	Limpiar Pantalla;
	// En cada fila de la primer columna se almacenar� el n�mero de ID de cada paciente ingresado
	// Usamos la funci�n ConvertirATexto() en nuestra entero (numeroPaciente)
	datosPacientes[numeroPaciente,0] <- ConvertirATexto(numeroPaciente);
	
	// Se le solicita al usuario que ingrese su nombre
	Escribir "Ingrese el nombre del paciente: " Sin Saltar;
	// Se almacenara el nombre en la segunda columna
	Leer datosPacientes[numeroPaciente,1];
	Limpiar Pantalla;
	
	// Se le solicita al usuario que ingrese su apellido
	Escribir "Ingrese el apellido del paciente: " Sin Saltar;
	// Se almacenara el apellido en la tercer columna
	Leer datosPacientes[numeroPaciente,2];
	Limpiar Pantalla;
	
	// Se le solicita al usuario que ingrese su DNI
	Escribir "Ingrese el DNI del paciente: " Sin Saltar;
	// Se almacenara el DNI en una variable dni
	// Se utilizar� esta variable para comprobar que le DNI ingresado sea v�lido antes de guardarlo en la matriz de datos
	Leer dni;
	Limpiar Pantalla;
	
	// Luego se utiliza un ciclo mientras para verificar que se haya ingresado un DNI v�lido
	contador <- 0;
	swichtDni_2 <- Falso;
	// Mientras (swichtDni_2) sea falso
	Mientras swichtDni_2 = Falso Hacer
		// Itera por cada fila de la columna seis DNI 
		Para i <- 0 Hasta 998 Hacer
			// Si el DNI ingresado es igual al DNI almacenado en una de las filas de la columna seis DNI
			Si ConvertirANumero(datosPacientes[i,6]) = dni Entonces
				// Terminamos el ciclo Para
				i <- 998;
				// Solicitamos que se ingrese otro DNI
				Escribir "El DNI ingresado ya esta en uso";
				Escribir "Ingrese el DNI del paciente: " Sin Saltar;
				Leer dni;
				Limpiar Pantalla;
			SiNo
				// Si el DNI ingresado no es igual al DNI almacenado sumamos mas uno al contador
				contador <- contador + 1;
			FinSi
		FinPara
		// Si el DNI ingresado es distinto de todos los DNI almacenados
		Si contador = 999 Entonces
			// La variable (swichtDni_2) se establece como verdadera y se sale del ciclo Mientras
			swichtDni_2 <- Verdadero;
		FinSi
		
	FinMientras
	
	
	swichtDni <- Falso;
	// Mientras (swichtDni) sea falso
	Mientras swichtDni = Falso  Hacer
		// La variable (long) es igual a la longitud del DNI ingresado
		long <- Longitud(ConvertirATexto(dni));
		// Si el DNI ingresado tiene entre 6 y 8 d�gitos
		Si long > 5 Y long < 9  Entonces
			// La variable (swichtDni) se establece como verdadera y se sale del ciclo Mientras
			swichtDni <- Verdadero;
		SiNo
			Escribir "Debe ingresar un DNI v�lido";
			Escribir "Ingrese el DNI del paciente: " Sin Saltar;
			Leer dni;
			Limpiar Pantalla;
		FinSi
		
	FinMientras
	
	datosPacientes[numeroPaciente,6] <- ConvertirATexto(dni);
	
	Escribir "Ingrese la edad del paciente: " Sin Saltar;
	Leer datosPacientes[numeroPaciente,3];
	Limpiar Pantalla;
	
	Escribir "Ingrese tipo de sangre del paciente: " Sin Saltar;
	Leer datosPacientes[numeroPaciente,4];
	Limpiar Pantalla;
	
	swichtSangre <- Falso;
	Mientras swichtSangre = Falso Hacer
		
		Para i <- 0 Hasta 7 Hacer
			Si Minusculas(datosPacientes[numeroPaciente,4]) = tipoSangre[i] Entonces
				swichtSangre <- Verdadero;
			FinSi
		FinPara
		
		Si swichtSangre = Falso Entonces
			Escribir "Debe ingresar un tipo de sangre v�lido (A+, B+, AB+, 0+, A-, B-, AB-, 0-)";
			Escribir "Ingrese tipo de sangre del paciente: " Sin Saltar;
			Leer datosPacientes[numeroPaciente,4];
			Limpiar Pantalla;
		FinSi
		
	FinMientras
	
	Escribir "                 Especialidades:";
	Escribir "1)Cardiolog�a";
	Escribir "2)Traumatolog�a";
	Escribir "3)Odontologia";
	Escribir "4)Pediatr�a";
	Escribir "5)Cl�nica";
	Escribir "6)Radiolog�a";
	Escribir "7)Dermatolog�a";
	Escribir "";
	Escribir "       Ingrese una opci�n: " Sin Saltar;
	Leer num_2;
	Limpiar Pantalla;
	
	swichtEspecialidad <- Falso;
	Mientras swichtEspecialidad = Falso Hacer
		
		
		Si num_2 > 0 Y num_2 < 8  Entonces
			swichtEspecialidad <- Verdadero;
			datosPacientes[numeroPaciente,5] <- especialidad[num_2 - 1];
		FinSi
		
		
		Si swichtEspecialidad = Falso Entonces
			Escribir "Debe ingresar una opci�n v�lida";
			Escribir "             Especialidades:";
			Escribir "             1)Cardiolog�a";
			Escribir "			    2)Traumatolog�a";
			Escribir "			    3)Odontologia";
			Escribir "			    4)Pediatr�a";
			Escribir "			    5)Cl�nica";
			Escribir "			    6)Radiolog�a";
			Escribir "			    7)Dermatolog�a";
			Escribir "";
			Escribir "       Ingrese una opci�n: " Sin Saltar;
			Leer num_2;
			Limpiar Pantalla;
		FinSi
		
	FinMientras
	
	
	numeroPaciente <- numeroPaciente + 1;
	Limpiar Pantalla;
	Escribir"";
	Escribir"";
	Escribir"";
	Escribir"                    El paciente fue cargado exitosamente.  ";
	Escribir"";
	Escribir"                           1) Volver al men�: " Sin Saltar;
	Leer num_1;
	Mientras num_1 <> 1 Hacer
		Limpiar Pantalla;
		Escribir"";
		Escribir"";
		Escribir"";
		Escribir"                    El paciente fue cargado exitosamente.  ";
		Escribir"";
		Escribir"                           1) Volver al men�: " Sin Saltar;
		Leer num_1;
	FinMientras
	
	Limpiar Pantalla;
FinSubProceso



SubProceso buscar(datosPacientes,idPaciente)
	Definir dni,paciente Como Entero;
	Definir i,j,num_1,num_2 como Entero;
	Definir swichtBuscar Como Logico;
	
	swichtBuscar <- Falso;
	Mientras swichtBuscar = Falso Hacer
		Limpiar Pantalla;
		Escribir "Ingrese un DNI: " Sin Saltar;
		leer dni;
		
		
		paciente <- 0;
		Para i <- 0 Hasta 998 Hacer
			Si datosPacientes[i,6] = ConvertirATexto(dni) Entonces
				
				paciente <- i;
				swichtBuscar <- Verdadero;
				imprimirDatos(datosPacientes,swichtBuscar,paciente);
		
			FinSi
		FinPara
		
		
		Si swichtBuscar = Falso Entonces
			Limpiar Pantalla;
			Escribir "No se encontr� ning�n paciente que concuerde con los datos ingresados";
			Escribir "";
			Escribir "    1) Buscar paciente";
			Escribir "    2) Volver al menu";
			Escribir "    Ingrese una opcion: " Sin Saltar;
			Leer num_2;
			Si num_2 = 2 Entonces
				swichtBuscar <- Verdadero;
			FinSi
		FinSi
		Limpiar Pantalla;
	FinMientras
	
	
	
FinSubProceso



SubProceso imprimirDatos(datosPacientes,swichtBuscar,paciente)
	Definir num_1 Como Entero;
	
	Limpiar Pantalla;
	Escribir "";
	Escribir "";
	Escribir "";
	Escribir "                         ID: 00" , (paciente + 1);
	Escribir "                         Nombre: " ,datosPacientes[paciente,1];
	Escribir "                         Apellido: " ,datosPacientes[paciente,2];
	Escribir "                         DNI: " ,datosPacientes[paciente,6];
	Escribir "                         Edad: " ,datosPacientes[paciente,3];
	Escribir "                         Tipo de sangre: " ,datosPacientes[paciente,4];
	Escribir "                         Especialidad requerida: " ,datosPacientes[paciente,5];
	Escribir "";
	Escribir "";
	Escribir "                         1) Volver al menu: " Sin Saltar ;
		
	Leer num_1;
	Mientras  num_1 <> 1 Hacer
		Limpiar Pantalla;
		Escribir "";
		Escribir "";
		Escribir "";
		Escribir "                         Ingrese una opcion correcta";
		Escribir "                         1) Volver al menu: " Sin Saltar;
			
		Leer num_1;
	FinMientras
	
	Limpiar Pantalla;
FinSubProceso



SubProceso modificar
	
FinSubProceso



SubProceso eliminar
	
FinSubProceso


// Este es el Proceso principal.

Proceso Hospital
	menu();
FinProceso


