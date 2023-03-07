#!/bin/bash
#
# sokdr
# https://github.com/sokdr
#
tput clear
trap ctrl_c INT

function ctrl_c() {
        echo "**You pressed Ctrl+C...Exiting"
        exit 0;
}

function errorMenu(){
	echo "ERROR! Opción incorrecta. Debes introducir una de las opciones del menú."
}

function ayuda(){
case $opcion in 
	1)
		echo "Esta opción muestra información del Kernel de Linux."
		echo ""
	;;
	2)
		echo "Esta opción muestra el usuario actual e información de identificación."
		echo ""
	;;
	3)
		echo "Esta opción muestra información de la distribución de Linux"
		echo ""
	;;
	4)
		echo "Esta opción muestra una lista de usuarios registrados."
		echo ""
	;;
	5)
		echo "Esta opción muestra $HOSTNAME Información sobre el tiempo de actividad."
		echo ""
	;;
	6)
		echo "Esta opción muestra los servicios activos"
		echo ""
	;;
	7)
		echo "Esta opción muestra las conexiones activas de internet y puertos abiertos."
		echo ""
	;;
	8)
		echo "Esta opción comprueba el espacio disponible."
		echo ""
	;;
	9)
		echo "Esta opción comprueba memoria."
		echo ""
	;;
	10)
		echo "Esta opción muestra el historial (Comandos)."
		echo ""
	;;
	11)
		echo "Esta opción nos muestra las interfaces de red."
		echo ""
	;;
	12)
		echo "Esta opción muestra la información de IPtable."
		echo ""
	;;
	13)
		echo "Esta opción comprueba los procesos en ejecución."
		echo ""
	;;
	14)
		echo "Esta opción comprueba la configuración SSH."
		echo ""
	;;
	15)
		echo "Esta opción nos muestra una lista de todos los paquetes instalados."
		echo ""
	;;
	16)
		echo "Esta opción muestra los parámetros de red."
		echo ""
	;;
	17)	
		echo "Esta opción nos muestra la política de contraseñas."
		echo ""
	;;
	18)
		echo "Esta opción comprueba el archivo de libro de pedidos."
		echo ""
	;;	
	19)
		echo "Esta opción comprueba las dependencias rotas."
		echo ""
	;;
	20)
		echo "Esta opción muestra el mensaje del banner MOTD."
		echo ""
	;;
	21)
		echo "Esta opción muestra el listado de nombres de usuario."
		echo ""
	;;
	22)
		echo "Esta opción comprueba contraseñas nulas."
		echo ""
	;;
	23)
		echo "Esta opción muestra la tabla de enrutamiento IP."
		echo ""
	;;
	24)
		echo "Esta opción muestra los mensajes del Kernel."
		echo ""
	;;
	25)
		echo "Esta opción comprueba los paquetes actualizables."
		echo ""
	;;
	26)
		echo "Esta opción muestra información sobre la CPU y el sistema."
		echo ""
	;;
	27)
		echo "Esta opción nos muestra los paquetes TCP."
		echo ""
	;;
	28)
		echo "Esta opción nos muestra los intentos fallidos de inicio de sesión."
		echo ""
	;;
	esac
}



function printMenu() {
echo -e "###############################################"
echo -e "###############################################"
echo -e "###############################################"
echo " _    _                 _          _ _ _    "
echo "| |  (_)_ _ _  ___ __  /_\ _  _ __| (_) |_ "
echo "| |__| |   \ || \ \ / / _ \ || / _  | |  _|"
echo "|____|_|_||_\_ _/_\_\/_/ \_\_ _\__ _|_|\__|"
echo
echo "###############################################"
echo "Welcome to security audit of your linux machine:"
echo "###############################################"
echo ""
echo "----------- MENÚ -----------"
echo ""
echo "0.  Terminar programa."
echo "1.  Información del Kernel de Linux."
echo "2.  Usuario actual e información de identificación."
echo "3.  Información de la distribución de Linux"
echo "4.  Lista de usuarios registrados."
echo "5.  $HOSTNAME Información sobre el tiempo de actividad."
echo "6.  Servicios activos"
echo "7.  Conexiones activas de internet y puertos abiertos."
echo "8.  Comprobar el espacio disponible."
echo "9.  Comprobar memoria."
echo "10. Historial (Comandos)."
echo "11. Interfaces de red."
echo "12. Información IPtable."
echo "13. Comprobar procesos en ejecución."
echo "14. Comprobar la configuración SSH."
echo "15. Listado de todos los paquetes instalados."
echo "16. Parámetros de red."
echo "17. Política de contraseñas."
echo "18. Compruebe el archivo de libro de pedidos."
echo "19. Compruebación de dependencias rotas."
echo "20. Mensaje del banner MOTD."
echo "21. Listado de nombres de usuario."
echo "22. Comprobar contraseñas nulas."
echo "23. Tabla de enrutamiento IP."
echo "24. Mensajes del Kernel."
echo "25. Comprobar paquetes actualizables."
echo "26. Información sobre la CPU y el sistema."
echo "27. Paquetes TCP."
echo "28. Intentos fallidos de inicio de sesión."
echo ""
}


while [[ $opcion -gt 0 || $opcion -lt 29 ]]
do
	printMenu
	read -p "Introduzca una opción: " opcion ayuda
	
	if [[ ! -z $ayuda ]] && [[ $ayuda == "--help" ]]
	then 
		ayuda
	fi
	
	case $opcion in 
		0) 
			echo "El programa ha terminado."
			exit 0
		;;
		1) 
			seleccion=-1
		      while [[ $seleccion -lt 0 || $seleccion -gt 3 ]]
		       do
			echo "OPCINOES: "
			echo "1. ¿Quiere mostrar el resultado por pantalla?"
			echo "2. ¿Quiere guardar el resultado en un fichero?"
			echo "3. ¿Quiere ambas opciones?"
			read -p "Introduzca la opción que desea realizar: " seleccion
			
			case $seleccion in
				1) 
					echo -e "1. Información del Kernel de Linux."
					echo
					uname -a
					echo
					echo "###############################################"
						
				;;
				2) 
					echo -e "1. Información del Kernel de Linux." | tee -a auditoria.txt >/dev/null
					echo | tee -a auditoria.txt >/dev/null
					uname -a | tee -a auditoria.txt >/dev/null
					echo | tee -a auditoria.txt >/dev/null
					echo "###############################################" | tee -a auditoria.txt >/dev/null

					
				;;
				3) 
					echo -e "1. Información del Kernel de Linux." | tee -a auditoria.txt 
					echo | tee -a auditoria.txt
					uname -a | tee -a auditoria.txt
					echo | tee -a auditoria.txt
					echo "###############################################" | tee -a auditoria.txt
					
				;;
				*) 
					errorMenu
				esac
                        done
		;; 
		2) 
			seleccion=-1
			while [[ $opcion -lt 0 || $opcion -gt 3 ]]
		       do
			echo "OPCINOES: "
			echo "1. ¿Quiere mostrar el resultado por pantalla?"
			echo "2. ¿Quiere guardar el resultado en un fichero?"
			echo "3. ¿Quiere ambas opciones?"
			read -p "Introduzca la opción que desea realizar: " seleccion
			
			case $seleccion in
				1) 
					echo -e "2. Usuario actual e información de identificación. "
					echo
					whoami
					echo
					id
					echo
					echo "###############################################"
						
				;;
				2) 
					echo -e "2. Usuario actual e información de identificación. " | tee -a auditoria.txt >/dev/null
					echo | tee -a auditoria.txt >/dev/null
					whoami | tee -a auditoria.txt >/dev/null
					echo | tee -a auditoria.txt >/dev/null
					id | tee -a auditoria.txt >/dev/null
					echo | tee -a auditoria.txt >/dev/null
					echo "###############################################" | tee -a auditoria.txt >/dev/null

					
				;;
				3) 
					echo -e "2. Usuario actual e información de identificación. " | tee -a auditoria.txt 
					echo | tee -a auditoria.txt
					whoami | tee -a auditoria.txt
					echo | tee -a auditoria.txt
					id | tee -a auditoria.txt
					echo | tee -a auditoria.txt
					echo "###############################################" | tee -a auditoria.txt
					
				;;
				*) 
					errorMenu
				esac
                        done
		;; 
		3) 
			seleccion=-1
			while [[ $opcion -lt 0 || $opcion -gt 3 ]]
		       do
			echo "OPCINOES: "
			echo "1. ¿Quiere mostrar el resultado por pantalla?"
			echo "2. ¿Quiere guardar el resultado en un fichero?"
			echo "3. ¿Quiere ambas opciones?"
			read -p "Introduzca la opción que desea realizar: " seleccion
			
			case $seleccion in
				1) 
					echo -e "3.  Información de la distribución de Linux"
					echo
					lsb_release -a
					echo
					echo "###############################################"
						
				;;
				2) 
					echo -e "3.  Información de la distribución de Linux" | tee -a auditoria.txt >/dev/null
					echo | tee -a auditoria.txt >/dev/null
					lsb_release -a | tee -a auditoria.txt >/dev/null
					echo | tee -a auditoria.txt >/dev/null
					echo "###############################################" | tee -a auditoria.txt >/dev/null

					
				;;
				3) 
					echo -e "3.  Información de la distribución de Linux" | tee -a auditoria.txt 
					echo | tee -a auditoria.txt
					lsb_release -a | tee -a auditoria.txt
					echo | tee -a auditoria.txt
					echo "###############################################" | tee -a auditoria.txt
					
				;;
				*) 
					errorMenu
				esac
                        done
		;;
		4)
			seleccion=-1 
			while [[ $opcion -lt 0 || $opcion -gt 3 ]]
		       do
			echo "OPCINOES: "
			echo "1. ¿Quiere mostrar el resultado por pantalla?"
			echo "2. ¿Quiere guardar el resultado en un fichero?"
			echo "3. ¿Quiere ambas opciones?"
			read -p "Introduzca la opción que desea realizar: " seleccion
			
			case $seleccion in
				1) 
					echo -e "4. Lista de usuarios registrados."
					echo
					w
					echo
					echo "###############################################"
					
				;;
				2) 
					echo -e "4. Lista de usuarios registrados." | tee -a auditoria.txt >/dev/null
					echo | tee -a auditoria.txt >/dev/null
					w | tee -a auditoria.txt >/dev/null
					echo | tee -a auditoria.txt >/dev/null
					echo "###############################################" | tee -a auditoria.txt >/dev/null

					
				;;
				3) 
					echo -e "4. Lista de usuarios registrados." | tee -a auditoria.txt 
					echo | tee -a auditoria.txt
					w | tee -a auditoria.txt
					echo | tee -a auditoria.txt
					echo "###############################################" | tee -a auditoria.txt
					
				;;
				*) 
					errorMenu
				esac
                        done
		;;
		5) 
			seleccion=-1
			while [[ $opcion -lt 0 || $opcion -gt 3 ]]
		       do
			echo "OPCINOES: "
			echo "1. ¿Quiere mostrar el resultado por pantalla?"
			echo "2. ¿Quiere guardar el resultado en un fichero?"
			echo "3. ¿Quiere ambas opciones?"
			read -p "Introduzca la opción que desea realizar: " seleccion
			
			case $seleccion in
				1) 
					echo -e "5. $HOSTNAME Información sobre el tiempo de actividad."
					echo
					uptime
					echo
					echo "###############################################"
					
				;;
				2) 
					echo -e "5. $HOSTNAME Información sobre el tiempo de actividad." | tee -a auditoria.txt >/dev/null
					echo | tee -a auditoria.txt >/dev/null
					uptime | tee -a auditoria.txt >/dev/null
					echo | tee -a auditoria.txt >/dev/null
					echo "###############################################" | tee -a auditoria.txt >/dev/null

					
				;;
				3) 
					echo -e "5. $HOSTNAME Información sobre el tiempo de actividad." | tee -a auditoria.txt 
					echo | tee -a auditoria.txt
					uptime | tee -a auditoria.txt
					echo | tee -a auditoria.txt
					echo "###############################################" | tee -a auditoria.txt
					
				;;
				*) 
					errorMenu
				esac
                        done
		;;
		6) 
			seleccion=-1
			while [[ $opcion -lt 0 || $opcion -gt 3 ]]
		       do
			echo "OPCINOES: "
			echo "1. ¿Quiere mostrar el resultado por pantalla?"
			echo "2. ¿Quiere guardar el resultado en un fichero?"
			echo "3. ¿Quiere ambas opciones?"
			read -p "Introduzca la opción que desea realizar: " seleccion
			
			case $seleccion in
				1) 
					echo -e "6. Servicios activos"
					echo
					service --status-all |grep "+"
					echo
					echo "###############################################"
					
				;;
				2) 
					echo -e "6. Servicios activos" | tee -a auditoria.txt >/dev/null
					echo | tee -a auditoria.txt >/dev/null
					service --status-all |grep "+" | tee -a auditoria.txt >/dev/null
					echo | tee -a auditoria.txt >/dev/null
					echo "###############################################" | tee -a auditoria.txt >/dev/null

					
				;;
				3) 
					echo -e "6. Servicios activos" | tee -a auditoria.txt 
					echo | tee -a auditoria.txt
					service --status-all |grep "+" | tee -a auditoria.txt
					echo | tee -a auditoria.txt
					echo "###############################################" | tee -a auditoria.txt
					
				;;
				*) 
					errorMenu
				esac
                        done
		;;
		7) 
			seleccion=-1
			while [[ $opcion -lt 0 || $opcion -gt 3 ]]
		       do
			echo "OPCINOES: "
			echo "1. ¿Quiere mostrar el resultado por pantalla?"
			echo "2. ¿Quiere guardar el resultado en un fichero?"
			echo "3. ¿Quiere ambas opciones?"
			read -p "Introduzca la opción que desea realizar: " seleccion
			
			case $seleccion in
				1) 
					echo -e "7. Conexiones activas de internet y puertos abiertos."
					echo
					netstat -natp
					echo
					echo "###############################################"
					
				;;
				2) 
					echo -e "7. Conexiones activas de internet y puertos abiertos." | tee -a auditoria.txt >/dev/null
					echo | tee -a auditoria.txt >/dev/null
					netstat -natp | tee -a auditoria.txt >/dev/null
					echo | tee -a auditoria.txt >/dev/null
					echo "###############################################" | tee -a auditoria.txt >/dev/null

					
				;;
				3) 
					echo -e "7. Conexiones activas de internet y puertos abiertos." | tee -a auditoria.txt 
					echo | tee -a auditoria.txt
					netstat -natp | tee -a auditoria.txt
					echo | tee -a auditoria.txt
					echo "###############################################" | tee -a auditoria.txt
					
				;;
				*) 
					errorMenu
				esac
                        done
		;;
		8) 
			seleccion=-1
			while [[ $opcion -lt 0 || $opcion -gt 3 ]]
		       do
			echo "OPCINOES: "
			echo "1. ¿Quiere mostrar el resultado por pantalla?"
			echo "2. ¿Quiere guardar el resultado en un fichero?"
			echo "3. ¿Quiere ambas opciones?"
			read -p "Introduzca la opción que desea realizar: " seleccion
			
			case $seleccion in
				1) 
					echo -e "8. Comprobar el espacio disponible."
					echo
					df -h
					echo
					echo "###############################################"
					
				;;
				2) 
					echo -e "8. Comprobar el espacio disponible." | tee -a auditoria.txt >/dev/null
					echo | tee -a auditoria.txt >/dev/null
					df -h | tee -a auditoria.txt >/dev/null
					echo | tee -a auditoria.txt >/dev/null
					echo "###############################################" | tee -a auditoria.txt >/dev/null

					
				;;
				3) 
					echo -e "8. Comprobar el espacio disponible." | tee -a auditoria.txt 
					echo | tee -a auditoria.txt
					df -h | tee -a auditoria.txt
					echo | tee -a auditoria.txt
					echo "###############################################" | tee -a auditoria.txt
					
				;;
				*) 
					errorMenu
				esac
                        done
		;;
		9) 
			seleccion=-1
			while [[ $opcion -lt 0 || $opcion -gt 3 ]]
		       do
			echo "OPCINOES: "
			echo "1. ¿Quiere mostrar el resultado por pantalla?"
			echo "2. ¿Quiere guardar el resultado en un fichero?"
			echo "3. ¿Quiere ambas opciones?"
			read -p "Introduzca la opción que desea realizar: " seleccion
			
			case $seleccion in
				1) 
					echo -e "9. Comprobar memoria."
					echo
					free -h
					echo
					echo "###############################################"
					
				;;
				2) 
					echo -e "9. Comprobar memoria." | tee -a auditoria.txt >/dev/null
					echo | tee -a auditoria.txt >/dev/null
					free -h | tee -a auditoria.txt >/dev/null
					echo | tee -a auditoria.txt >/dev/null
					echo "###############################################" | tee -a auditoria.txt >/dev/null

					
				;;
				3) 
					echo -e "9. Comprobar memoria." | tee -a auditoria.txt 
					echo | tee -a auditoria.txt
					free -h | tee -a auditoria.txt
					echo | tee -a auditoria.txt
					echo "###############################################" | tee -a auditoria.txt
					
				;;
				*) 
					errorMenu
				esac
                        done
		;;
		10)
			seleccion=-1 
			while [[ $opcion -lt 0 || $opcion -gt 3 ]]
		       do
			echo "OPCINOES: "
			echo "1. ¿Quiere mostrar el resultado por pantalla?"
			echo "2. ¿Quiere guardar el resultado en un fichero?"
			echo "3. ¿Quiere ambas opciones?"
			read -p "Introduzca la opción que desea realizar: " seleccion
			
			case $seleccion in
				1) 
					echo -e "10. Historial (Comandos)."
					echo
					history
					echo
					echo "###############################################"
					
				;;
				2) 
					echo -e "10. Historial (Comandos)." | tee -a auditoria.txt >/dev/null
					echo | tee -a auditoria.txt >/dev/null
					history | tee -a auditoria.txt >/dev/null
					echo | tee -a auditoria.txt >/dev/null
					echo "###############################################" | tee -a auditoria.txt >/dev/null

					
				;;
				3) 
					echo -e "10. Historial (Comandos)." | tee -a auditoria.txt 
					echo | tee -a auditoria.txt
					history | tee -a auditoria.txt
					echo | tee -a auditoria.txt
					echo "###############################################" | tee -a auditoria.txt
					
				;;
				*) 
					errorMenu
				esac
                        done
		;;
		11) 
			seleccion=-1
			while [[ $opcion -lt 0 || $opcion -gt 3 ]]
		       do
			echo "OPCINOES: "
			echo "1. ¿Quiere mostrar el resultado por pantalla?"
			echo "2. ¿Quiere guardar el resultado en un fichero?"
			echo "3. ¿Quiere ambas opciones?"
			read -p "Introduzca la opción que desea realizar: " seleccion
			
			case $seleccion in
				1) 
					echo -e "11. Interfaces de red."
					echo
					ifconfig -a
					echo
					echo "###############################################"
					
				;;
				2) 
					echo -e "11. Interfaces de red." | tee -a auditoria.txt >/dev/null
					echo | tee -a auditoria.txt >/dev/null
					ifconfig -a | tee -a auditoria.txt >/dev/null
					echo | tee -a auditoria.txt >/dev/null
					echo "###############################################" | tee -a auditoria.txt >/dev/null

					
				;;
				3) 
					echo -e "11. Interfaces de red." | tee -a auditoria.txt 
					echo | tee -a auditoria.txt
					ifconfig -a | tee -a auditoria.txt
					echo | tee -a auditoria.txt
					echo "###############################################" | tee -a auditoria.txt
					
				;;
				*) 
					errorMenu
				esac
                        done
		;;
		12) 
			seleccion=-1
			while [[ $opcion -lt 0 || $opcion -gt 3 ]]
		       do
			echo "OPCINOES: "
			echo "1. ¿Quiere mostrar el resultado por pantalla?"
			echo "2. ¿Quiere guardar el resultado en un fichero?"
			echo "3. ¿Quiere ambas opciones?"
			read -p "Introduzca la opción que desea realizar: " seleccion
			
			case $seleccion in
				1) 
					echo -e "12. Información IPtable."
					echo
					iptables -L -n -v
					echo
					echo "###############################################"
					
				;;
				2) 
					echo -e "12. Información IPtable." | tee -a auditoria.txt >/dev/null
					echo | tee -a auditoria.txt >/dev/null
					iptables -L -n -v | tee -a auditoria.txt >/dev/null
					echo | tee -a auditoria.txt >/dev/null
					echo "###############################################" | tee -a auditoria.txt >/dev/null

					
				;;
				3) 
					echo -e "12. Información IPtable." | tee -a auditoria.txt 
					echo | tee -a auditoria.txt
					iptables -L -n -v | tee -a auditoria.txt
					echo | tee -a auditoria.txt
					echo "###############################################" | tee -a auditoria.txt
					
				;;
				*) 
					errorMenu
				esac
                        done
		;;
		13) 
			seleccion=-1
			while [[ $opcion -lt 0 || $opcion -gt 3 ]]
		       do
			echo "OPCINOES: "
			echo "1. ¿Quiere mostrar el resultado por pantalla?"
			echo "2. ¿Quiere guardar el resultado en un fichero?"
			echo "3. ¿Quiere ambas opciones?"
			read -p "Introduzca la opción que desea realizar: " seleccion
			
			case $seleccion in
				1) 
					echo -e "13. Comprobar procesos en ejecución."
					echo
					ps -a
					echo
					echo "###############################################"
					
				;;
				2) 
					echo -e "13. Comprobar procesos en ejecución." | tee -a auditoria.txt >/dev/null
					echo | tee -a auditoria.txt >/dev/null
					ps -a | tee -a auditoria.txt >/dev/null
					echo | tee -a auditoria.txt >/dev/null
					echo "###############################################" | tee -a auditoria.txt >/dev/null

					
				;;
				3) 
					echo -e "13. Comprobar procesos en ejecución." | tee -a auditoria.txt 
					echo | tee -a auditoria.txt
					ps -a | tee -a auditoria.txt
					echo | tee -a auditoria.txt
					echo "###############################################" | tee -a auditoria.txt
					
				;;
				*) 
					errorMenu
				esac
                        done
		;;
		14) 
			seleccion=-1
			while [[ $opcion -lt 0 || $opcion -gt 3 ]]
		       do
			echo "OPCINOES: "
			echo "1. ¿Quiere mostrar el resultado por pantalla?"
			echo "2. ¿Quiere guardar el resultado en un fichero?"
			echo "3. ¿Quiere ambas opciones?"
			read -p "Introduzca la opción que desea realizar: " seleccion
			
			case $seleccion in
				1) 
					echo -e "14. Comprobar la configuración SSH."
					echo
					cat /etc/ssh/sshd_config
					echo
					echo "###############################################"
					
				;;
				2) 
					echo -e "14. Comprobar la configuración SSH." | tee -a auditoria.txt >/dev/null
					echo | tee -a auditoria.txt >/dev/null
					cat /etc/ssh/sshd_config | tee -a auditoria.txt >/dev/null
					echo | tee -a auditoria.txt >/dev/null
					echo "###############################################" | tee -a auditoria.txt >/dev/null

					
				;;
				3) 
					echo -e "14. Comprobar la configuración SSH." | tee -a auditoria.txt 
					echo | tee -a auditoria.txt
					cat /etc/ssh/sshd_config | tee -a auditoria.txt
					echo | tee -a auditoria.txt
					echo "###############################################" | tee -a auditoria.txt
					
				;;
				*) 
					errorMenu
				esac
                        done
		;;
		15) 
			seleccion=-1
			while [[ $opcion -lt 0 || $opcion -gt 3 ]]
		       do
			echo "OPCINOES: "
			echo "1. ¿Quiere mostrar el resultado por pantalla?"
			echo "2. ¿Quiere guardar el resultado en un fichero?"
			echo "3. ¿Quiere ambas opciones?"
			read -p "Introduzca la opción que desea realizar: " seleccion
			
			case $seleccion in
				1) 
					echo -e "15. Listado de todos los paquetes instalados."
					apt-cache pkgnames
					echo
					echo "###############################################"
					
				;;
				2) 
					echo -e "15. Listado de todos los paquetes instalados." | tee -a auditoria.txt >/dev/null
					apt-cache pkgnames | tee -a auditoria.txt >/dev/null
					echo | tee -a auditoria.txt >/dev/null
					echo "###############################################" | tee -a auditoria.txt >/dev/null

					
				;;
				3) 
					echo -e "15. Listado de todos los paquetes instalados." | tee -a auditoria.txt 
					apt-cache pkgnames | tee -a auditoria.txt
					echo | tee -a auditoria.txt
					echo "###############################################" | tee -a auditoria.txt
					
				;;
				*) 
					errorMenu
				esac
                        done
		
		;;
		16) 
			seleccion=-1
			while [[ $opcion -lt 0 || $opcion -gt 3 ]]
		       do
			echo "OPCINOES: "
			echo "1. ¿Quiere mostrar el resultado por pantalla?"
			echo "2. ¿Quiere guardar el resultado en un fichero?"
			echo "3. ¿Quiere ambas opciones?"
			read -p "Introduzca la opción que desea realizar: " seleccion
			
			case $seleccion in
				1) 
					echo -e "16. Parámetros de red."
					echo
					cat /etc/sysctl.conf
					echo
					echo "###############################################"
					
				;;
				2) 
					echo -e "16. Parámetros de red." | tee -a auditoria.txt >/dev/null
					echo | tee -a auditoria.txt >/dev/null
					cat /etc/sysctl.conf | tee -a auditoria.txt >/dev/null
					echo | tee -a auditoria.txt >/dev/null
					echo "###############################################" | tee -a auditoria.txt >/dev/null

					
				;;
				3) 
					echo -e "16. Parámetros de red." | tee -a auditoria.txt 
					echo | tee -a auditoria.txt
					cat /etc/sysctl.conf | tee -a auditoria.txt
					echo | tee -a auditoria.txt
					echo "###############################################" | tee -a auditoria.txt
					
				;;
				*) 
					errorMenu
				esac
                        done
		;;
		17) 
			seleccion=-1
			while [[ $opcion -lt 0 || $opcion -gt 3 ]]
		       do
			echo "OPCINOES: "
			echo "1. ¿Quiere mostrar el resultado por pantalla?"
			echo "2. ¿Quiere guardar el resultado en un fichero?"
			echo "3. ¿Quiere ambas opciones?"
			read -p "Introduzca la opción que desea realizar: " seleccion
			
			case $seleccion in
				1) 
					echo -e "17. Política de contraseñas."
					echo
					cat /etc/pam.d/common-password
					echo
					echo "###############################################"
					
				;;
				2) 
					echo -e "17. Política de contraseñas." | tee -a auditoria.txt >/dev/null
					echo | tee -a auditoria.txt >/dev/null
					cat /etc/pam.d/common-password | tee -a auditoria.txt >/dev/null
					echo | tee -a auditoria.txt >/dev/null
					echo "###############################################" | tee -a auditoria.txt >/dev/null

					
				;;
				3) 
					echo -e "17. Política de contraseñas." | tee -a auditoria.txt 
					echo | tee -a auditoria.txt
					cat /etc/pam.d/common-password | tee -a auditoria.txt
					echo | tee -a auditoria.txt
					echo "###############################################" | tee -a auditoria.txt
					
				;;
				*) 
					errorMenu
				esac
                        done
		;;
		18) 
			seleccion=-1
			while [[ $opcion -lt 0 || $opcion -gt 3 ]]
		       do
			echo "OPCINOES: "
			echo "1. ¿Quiere mostrar el resultado por pantalla?"
			echo "2. ¿Quiere guardar el resultado en un fichero?"
			echo "3. ¿Quiere ambas opciones?"
			read -p "Introduzca la opción que desea realizar: " seleccion
			
			case $seleccion in
				1) 
					echo -e "18. Compruebe el archivo de libro de pedidos."
					echo
					cat /etc/apt/sources.list
					echo
					echo "###############################################"
					
				;;
				2) 
					echo -e "18. Compruebe el archivo de libro de pedidos." | tee -a auditoria.txt >/dev/null
					echo | tee -a auditoria.txt >/dev/null
					cat /etc/apt/sources.list | tee -a auditoria.txt >/dev/null
					echo | tee -a auditoria.txt >/dev/null
					echo "###############################################" | tee -a auditoria.txt >/dev/null

					
				;;
				3) 
					echo -e "18. Compruebe el archivo de libro de pedidos." | tee -a auditoria.txt 
					echo | tee -a auditoria.txt
					cat /etc/apt/sources.list | tee -a auditoria.txt
					echo | tee -a auditoria.txt
					echo "###############################################" | tee -a auditoria.txt
					
				;;
				*) 
					errorMenu
				esac
                        done
		;;
		19)
			seleccion=-1
			while [[ $opcion -lt 0 || $opcion -gt 3 ]]
		       do
			echo "OPCINOES: "
			echo "1. ¿Quiere mostrar el resultado por pantalla?"
			echo "2. ¿Quiere guardar el resultado en un fichero?"
			echo "3. ¿Quiere ambas opciones?"
			read -p "Introduzca la opción que desea realizar: " seleccion
			
			case $seleccion in
				1) 
					echo -e "19. Compruebación de dependencias rotas."
					echo
					apt-get check
					echo
					echo "###############################################"
					
				;;
				2) 
					echo -e "19. Compruebación de dependencias rotas." | tee -a auditoria.txt >/dev/null
					echo | tee -a auditoria.txt >/dev/null
					apt-get check | tee -a auditoria.txt >/dev/null
					echo | tee -a auditoria.txt >/dev/null
					echo "###############################################" | tee -a auditoria.txt >/dev/null

					
				;;
				3) 
					echo -e "19. Compruebación de dependencias rotas." | tee -a auditoria.txt 
					echo | tee -a auditoria.txt
					apt-get check | tee -a auditoria.txt
					echo | tee -a auditoria.txt
					echo "###############################################" | tee -a auditoria.txt
					
				;;
				*) 
					errorMenu
				esac
                        done
		;;
		20)
			seleccion=-1
			while [[ $opcion -lt 0 || $opcion -gt 3 ]]
		       do
			echo "OPCINOES: "
			echo "1. ¿Quiere mostrar el resultado por pantalla?"
			echo "2. ¿Quiere guardar el resultado en un fichero?"
			echo "3. ¿Quiere ambas opciones?"
			read -p "Introduzca la opción que desea realizar: " seleccion
			
			case $seleccion in
				1) 
					echo -e "20. Mensaje del banner MOTD."
					echo
					cat /etc/motd
					echo
					echo "###############################################"
					
				;;
				2) 
					echo -e "20. Mensaje del banner MOTD." | tee -a auditoria.txt >/dev/null
					echo | tee -a auditoria.txt >/dev/null
					cat /etc/motd | tee -a auditoria.txt >/dev/null
					echo | tee -a auditoria.txt >/dev/null
					echo "###############################################" | tee -a auditoria.txt >/dev/null

					
				;;
				3) 
					echo -e "20. Mensaje del banner MOTD." | tee -a auditoria.txt 
					echo | tee -a auditoria.txt
					cat /etc/motd | tee -a auditoria.txt
					echo | tee -a auditoria.txt
					echo "###############################################" | tee -a auditoria.txt
					
				;;
				*) 
					errorMenu
				esac
                        done
		;;
		21) 
			seleccion=-1
			while [[ $opcion -lt 0 || $opcion -gt 3 ]]
		       do
			echo "OPCINOES: "
			echo "1. ¿Quiere mostrar el resultado por pantalla?"
			echo "2. ¿Quiere guardar el resultado en un fichero?"
			echo "3. ¿Quiere ambas opciones?"
			read -p "Introduzca la opción que desea realizar: " seleccion
			
			case $seleccion in
				1) 
					echo -e "21. Listado de nombres de usuario."
					echo
					cut -d: -f1 /etc/passwd
					echo
					echo "###############################################"
					
				;;
				2) 
					echo -e "21. Listado de nombres de usuario." | tee -a auditoria.txt >/dev/null
					echo | tee -a auditoria.txt >/dev/null
					cut -d: -f1 /etc/passwd | tee -a auditoria.txt >/dev/null
					echo | tee -a auditoria.txt >/dev/null
					echo "###############################################" | tee -a auditoria.txt >/dev/null

					
				;;
				3) 
					echo -e "21. Listado de nombres de usuario." | tee -a auditoria.txt 
					echo | tee -a auditoria.txt
					cut -d: -f1 /etc/passwd | tee -a auditoria.txt
					echo | tee -a auditoria.txt
					echo "###############################################" | tee -a auditoria.txt
					
				;;
				*) 
					errorMenu
				esac
                      done

		;;
		22) 
			seleccion=-1
			while [[ $opcion -lt 0 || $opcion -gt 3 ]]
		       do
			echo "OPCINOES: "
			echo "1. ¿Quiere mostrar el resultado por pantalla?"
			echo "2. ¿Quiere guardar el resultado en un fichero?"
			echo "3. ¿Quiere ambas opciones?"
			read -p "Introduzca la opción que desea realizar: " seleccion
			
			case $seleccion in
				1) 
					echo -e "22. Comprobar contraseñas nulas."
					echo
					users="$(cut -d: -f 1 /etc/passwd)"
					for x in $users
					do
					passwd -S $x |grep "NP"
					done
					echo
					echo "###############################################"
					
				;;
				2) 
					echo -e "22. Comprobar contraseñas nulas." | tee -a auditoria.txt >/dev/null
					echo | tee -a auditoria.txt >/dev/null
					users="$(cut -d: -f 1 /etc/passwd)" | tee -a auditoria.txt >/dev/null
					for x in $users 
					do 
					passwd -S $x |grep "NP" | tee -a auditoria.txt >/dev/null
					done 
					echo | tee -a auditoria.txt >/dev/null
					echo "###############################################" | tee -a auditoria.txt >/dev/null

					
				;;
				3) 
					echo -e "22. Comprobar contraseñas nulas." | tee -a auditoria.txt 
					echo | tee -a auditoria.txt
					users="$(cut -d: -f 1 /etc/passwd)" | tee -a auditoria.txt
					for x in $users 
					do 
					passwd -S $x |grep "NP" | tee -a auditoria.txt 
					done 
					echo | tee -a auditoria.txt
					echo "###############################################" | tee -a auditoria.txt
					
				;;
				*) 
					errorMenu
				esac
                      done
		
		;;
		23) 
			seleccion=-1
			while [[ $opcion -lt 0 || $opcion -gt 3 ]]
		       do
			echo "OPCINOES: "
			echo "1. ¿Quiere mostrar el resultado por pantalla?"
			echo "2. ¿Quiere guardar el resultado en un fichero?"
			echo "3. ¿Quiere ambas opciones?"
			read -p "Introduzca la opción que desea realizar: " seleccion
			
			case $seleccion in
				1) 
					echo -e "23. Tabla de enrutamiento IP."
					echo
					route
					echo
					echo "###############################################"
					
				;;
				2) 
					echo -e "23. Tabla de enrutamiento IP." | tee -a auditoria.txt >/dev/null
					echo | tee -a auditoria.txt >/dev/null
					route | tee -a auditoria.txt >/dev/null
					echo | tee -a auditoria.txt >/dev/null
					echo "###############################################" | tee -a auditoria.txt >/dev/null

					
				;;
				3) 
					echo -e "23. Tabla de enrutamiento IP." | tee -a auditoria.txt
					echo | tee -a auditoria.txt
					route | tee -a auditoria.txt
					echo | tee -a auditoria.txt
					echo "###############################################" | tee -a auditoria.txt
					
				;;
				*) 
					errorMenu
				esac
                      done
		;;
		24) 
			seleccion=-1
			while [[ $opcion -lt 0 || $opcion -gt 3 ]]
		       do
			echo "OPCINOES: "
			echo "1. ¿Quiere mostrar el resultado por pantalla?"
			echo "2. ¿Quiere guardar el resultado en un fichero?"
			echo "3. ¿Quiere ambas opciones?"
			read -p "Introduzca la opción que desea realizar: " seleccion
			
			case $seleccion in
				1) 
					echo -e "24. Mensajes del Kernel."
					echo
					dmesg
					echo
					echo "###############################################"
					
				;;
				2) 
					echo -e "24. Mensajes del Kernel." | tee -a auditoria.txt >/dev/null
					echo | tee -a auditoria.txt >/dev/null
					dmesg | tee -a auditoria.txt >/dev/null
					echo | tee -a auditoria.txt >/dev/null
					echo "###############################################" | tee -a auditoria.txt >/dev/null

					
				;;
				3) 
					echo -e "24. Mensajes del Kernel." | tee -a auditoria.txt
					echo | tee -a auditoria.txt
					dmesg | tee -a auditoria.txt
					echo | tee -a auditoria.txt
					echo "###############################################" | tee -a auditoria.txt
					
				;;
				*) 
					errorMenu
				esac
                      done
			
		;;
		25) 
			seleccion=-1
			while [[ $opcion -lt 0 || $opcion -gt 3 ]]
		       do
			echo "OPCINOES: "
			echo "1. ¿Quiere mostrar el resultado por pantalla?"
			echo "2. ¿Quiere guardar el resultado en un fichero?"
			echo "3. ¿Quiere ambas opciones?"
			read -p "Introduzca la opción que desea realizar: " seleccion
			
			case $seleccion in
				1) 
					echo -e "25. Comprobar paquetes actualizables."
					echo
					apt list --upgradeable
					echo
					echo "###############################################"
					
				;;
				2) 
					echo -e "25. Comprobar paquetes actualizables." | tee -a auditoria.txt >/dev/null
					echo | tee -a auditoria.txt >/dev/null
					apt list --upgradeable | tee -a auditoria.txt >/dev/null
					echo | tee -a auditoria.txt >/dev/null
					echo "###############################################" | tee -a auditoria.txt >/dev/null

					
				;;
				3) 
					echo -e "25. Comprobar paquetes actualizables." | tee -a auditoria.txt
					echo | tee -a auditoria.txt
					apt list --upgradeable | tee -a auditoria.txt
					echo | tee -a auditoria.txt
					echo "###############################################" | tee -a auditoria.txt
					
				;;
				*) 
					errorMenu
				esac
                      done
		;;
		26) 
			seleccion=-1
	             while [[ $opcion -lt 0 || $opcion -gt 3 ]]
		       do
			echo "OPCINOES: "
			echo "1. ¿Quiere mostrar el resultado por pantalla?"
			echo "2. ¿Quiere guardar el resultado en un fichero?"
			echo "3. ¿Quiere ambas opciones?"
			read -p "Introduzca la opción que desea realizar: " seleccion
			
			case $seleccion in
				1) 
					echo -e "26. Información sobre la CPU y el sistema."
					echo
					grep --color "failure" /var/log/auth.log
					echo
					echo "###############################################"
					
				;;
				2) 
					echo -e "26. Información sobre la CPU y el sistema." | tee -a auditoria.txt >/dev/null
					echo | tee -a auditoria.txt >/dev/null
					grep --color "failure" /var/log/auth.log | tee -a auditoria.txt >/dev/null
					echo | tee -a auditoria.txt >/dev/null
					echo "###############################################" | tee -a auditoria.txt >/dev/null

					
				;;
				3) 
					echo -e "26. Información sobre la CPU y el sistema." | tee -a auditoria.txt
					echo | tee -a auditoria.txt
					grep --color "failure" /var/log/auth.log | tee -a auditoria.txt
					echo | tee -a auditoria.txt
					echo "###############################################" | tee -a auditoria.txt
					
				;;
				*) 
					errorMenu
				esac
                      done
		;;
		27) 
			seleccion=-1
	              while [[ $opcion -lt 0 || $opcion -gt 3 ]]
		       do
			echo "OPCINOES: "
			echo "1. ¿Quiere mostrar el resultado por pantalla?"
			echo "2. ¿Quiere guardar el resultado en un fichero?"
			echo "3. ¿Quiere ambas opciones?"
			read -p "Introduzca la opción que desea realizar: " seleccion
			
			case $seleccion in
				1) 
					echo -e "27. Paquetes TCP."
					echo
					cat /etc/hosts.allow
					echo "///////////////////////////////////////"
					echo 
					cat /etc/hosts.deny
					echo 
					echo "###############################################"
					
				;;
				2) 
					echo -e "27. Paquetes TCP." | tee -a auditoria.txt >/dev/null
					echo | tee -a auditoria.txt >/dev/null
					cat /etc/hosts.allow | tee -a auditoria.txt >/dev/null
					echo "///////////////////////////////////////" | tee -a auditoria.txt >/dev/null
					echo | tee -a auditoria.txt >/dev/null
					cat /etc/hosts.deny | tee -a auditoria.txt >/dev/null
					echo | tee -a auditoria.txt >/dev/null
					echo "###############################################" | tee -a auditoria.txt >/dev/null

					
				;;
				3) 
					echo -e "27. Paquetes TCP." | tee -a auditoria.txt
					echo | tee -a auditoria.txt
					cat /etc/hosts.allow | tee -a auditoria.txt
					echo "///////////////////////////////////////" | tee -a auditoria.txt
					echo | tee -a auditoria.txt
					cat /etc/hosts.deny | tee -a auditoria.txt
					echo | tee -a auditoria.txt
					echo "###############################################" | tee -a auditoria.txt
					
				;;
				*) 
					errorMenu
				esac
                      done

		;;
		28) 	
			seleccion=-1
	              while [[ $opcion -lt 0 || $opcion -gt 3 ]]
		       do
			echo "OPCINOES: "
			echo "1. ¿Quiere mostrar el resultado por pantalla?"
			echo "2. ¿Quiere guardar el resultado en un fichero?"
			echo "3. ¿Quiere ambas opciones?"
			read -p "Introduzca la opción que desea realizar: " seleccion
			
			case $seleccion in
				1) 
					echo -e "28. Intentos fallidos de inicio de sesión."
					echo
					grep --color "failure" /var/log/auth.log
					echo
					echo "###############################################"
					
				;;
				2) 
					echo -e "28. Intentos fallidos de inicio de sesión."  | tee -a auditoria.txt >/dev/null
					echo | tee -a auditoria.txt >/dev/null
					grep --color "failure" /var/log/auth.log | tee -a auditoria.txt >/dev/null
					echo | tee -a auditoria.txt >/dev/null
					echo "###############################################" | tee -a auditoria.txt >/dev/null
					
				;;
				3) 
					echo -e "28. Intentos fallidos de inicio de sesión."  | tee -a auditoria.txt
					echo | tee -a auditoria.txt
					grep --color "failure" /var/log/auth.log | tee -a auditoria.txt
					echo | tee -a auditoria.txt
					echo "###############################################" | tee -a auditoria.txt
					
				;;
				*) 
					errorMenu
				esac
                      done
		
		;;
	esac
done

START=$(date +%s)
END=$(date +%s)
DIFF=$(( $END - $START ))

echo Script completed in $DIFF seconds :
echo
echo Executed on :
date
echo

exit 0;
