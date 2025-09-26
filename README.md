Portafolio de Prácticas en Flutter

Este proyecto es un portafolio de prácticas de desarrollo móvil con Flutter. La aplicación incluye varias pantallas y funcionalidades diseñadas para demostrar el uso de widgets con y sin estado, navegación, validación de formularios y un juego simple.

Estructura del Proyecto
La aplicación está organizada en varios archivos y directorios para mantener el código limpio.

main.dart: El punto de inicio de la aplicación.


HUB: El menú lateral (Drawer) que permite la navegación entre las diferentes prácticas.

Image.asset('assets/images/HUB.jpg')

Indice de practicas: Es el menu que contiene las diferentes practicas realizadas durante el parcial

Image.asset('assets/images/Indice.jpg')

Ajustes: Es el apartado que se localiza al momento de poner el modo oscuro de android y informacion del sistema.

Image.asset('assets/images/acercade.jpg')

Prácticas Incluidas

Práctica 1: Agregar "Hola Mundo"
Esta práctica demuestra el uso de un StatefulWidget para manejar un estado dinámico. Un botón flotante agrega un nuevo mensaje a una lista, actualizando la interfaz de usuario en tiempo real.

Image.asset('assets/images/agregar.jpg')

Práctica 2: Mostrar 10 "Hola Mundo"
En esta pantalla se utiliza una lista predefinida de 10 mensajes. Un botón cambia un valor booleano (true/false) para mostrar u ocultar la lista, demostrando cómo los widgets reaccionan a los cambios de estado.

Image.asset('assets/images/mostar.jpg')

Práctica 4: Formulario de Registro
Esta práctica se divide en dos archivos para una mejor organización del código. El formulario incluye validación de campos para el nombre, email, y contraseñas, además de un checkbox para aceptar los términos y condiciones.

Image.asset('assets/images/form.jpg')

Juego: Piedra, Papel o Tijera
Un juego interactivo donde el usuario se enfrenta a la aplicación. El juego mantiene un marcador para registrar las victorias y derrotas, y puede ser reiniciado en cualquier momento.

Image.asset('assets/images/juego.jpg')

Proyecto

Galería de Imágenes
Este proyecto es una galería que muestra imágenes del almacenamiento local de la aplicación. Utiliza una lista de nombres de archivos para construir una galería interactiva.

Image.asset('assets/images/imagenes.jpg')

Bloc de Notas
Una aplicación simple de notas donde puedes agregar, editar y eliminar notas.

Image.asset('assets/images/Bloc.jpg')

Calculadora de IMC
Una herramienta interactiva para calcular el Índice de Masa Corporal (IMC) a partir del peso y la altura del usuario.

Image.asset('assets/images/Calculadora.jpg')

Juego: Par o Impar
Un juego sencillo donde el usuario elige entre "par" o "impar" y la aplicación genera un número aleatorio para determinar al ganador.

Image.asset('assets/images/paroimpar.jpg')

Cómo Ejecutar la Aplicación
Asegúrate de tener Flutter instalado en tu máquina.

Clona o descarga este repositorio.

Abre el proyecto en tu editor de código preferido (como Visual Studio Code o Android Studio).

Abre una terminal y ejecuta el siguiente comando para obtener las dependencias:

flutter pub get

Conecta un dispositivo físico o inicia un emulador.

Ejecuta la aplicación con el siguiente comando:

flutter run