// Archivo: modulos/galeria_local.dart
// Importa el paquete de Material Design de Flutter, necesario para usar widgets como MaterialApp, Scaffold, etc.
import 'package:flutter/material.dart';
// Define una clase llamada GaleriaLocalModule que es un StatelessWidget, lo que significa que su contenido no cambia dinámicamente.
class GaleriaLocalModule extends StatelessWidget {
// El constructor de la clase. 'const' indica que la instancia puede ser una constante en tiempo de compilación para optimizar el rendimiento.
const GaleriaLocalModule({super.key});
// Esta es una lista de constantes (final y const) que contiene las rutas de las imágenes locales.
// El prefijo 'assets/images/' indica que las imágenes deben estar en esa carpeta del proyecto.
// Es importante que estas rutas coincidan con los archivos reales y con la configuración en el archivo pubspec.yaml.
final List<String> imageAssets = const [
'assets/images/imagen1.jpg',
'assets/images/image2.jpg',
'assets/images/image3.jpg',
'assets/images/image4.jpg',
'assets/images/image5.jpg',
];
// Define un método privado '_showImageDialog' que muestra un diálogo emergente cuando se pulsa una imagen.
// Recibe el contexto (context) para saber dónde se está mostrando el diálogo y la ruta de la imagen (imagePath).
void _showImageDialog(BuildContext context, String imagePath) {
// La función showDialog es una función de Flutter que muestra un diálogo.
showDialog(
// El contexto del widget actual.
context: context,
// builder es una función que construye el contenido del diálogo.
builder: (context) {
// Retorna un AlertDialog, un widget de diálogo estándar en Material Design.
return AlertDialog(
// Elimina el padding interno del contenido para que la imagen ocupe todo el espacio.
contentPadding: EdgeInsets.zero,
// El contenido del diálogo. Se usa un widget Column para organizar los elementos verticalmente.
content: Column(
// min indica que la columna debe ocupar el mínimo espacio vertical posible.
mainAxisSize: MainAxisSize.min,
// La lista de widgets hijos de la columna.
children: [
// Muestra la imagen desde los assets locales.
Image.asset(
// La ruta de la imagen que se va a mostrar.
imagePath,
// El ajuste de la imagen. BoxFit.cover asegura que la imagen cubra todo el espacio disponible.
fit: BoxFit.cover,
// Este callback se ejecuta si hay un error al cargar la imagen.
errorBuilder: (context, error, stackTrace) {
// Si hay un error, se muestra un widget de texto simple.
return const Text('Error al cargar la imagen');
},
),
// Agrega un widget Padding para crear espacio alrededor del texto.
Padding(
// Define un padding de 8.0 en todos los lados.
padding: const EdgeInsets.all(8.0),
// Muestra un widget de texto con un título.
child: Text(
 'Imagen de Portafolio',
// Aplica un estilo de tema al texto (título pequeño).
style: Theme.of(context).textTheme.titleSmall,
),
),
],
),
// La lista de acciones (botones) en la parte inferior del diálogo.
actions: [
// Un botón de texto que permite cerrar el diálogo.
TextButton(
// La función que se ejecuta cuando se presiona el botón.
onPressed: () {
// Navigator.of(context).pop() cierra el diálogo actual.
Navigator.of(context).pop();
},
// El texto que se muestra en el botón.
child: const Text('Cerrar'),
),
],
);
},
);
}
// El método 'build' es el corazón de un StatelessWidget, donde se construye la interfaz de usuario.
@override
Widget build(BuildContext context) {
// Retorna un widget Scaffold, que es el esqueleto de una página de Material Design.
return Scaffold(
// Define la barra de la aplicación en la parte superior.
appBar: AppBar(
// El título de la barra de la aplicación.
title: const Text('Galería Local'),
),
// El cuerpo de la página. GridView.builder es un widget que construye una cuadrícula a partir de una lista.
body: GridView.builder(
// Agrega un padding de 16 en todos los lados de la cuadrícula.
padding: const EdgeInsets.all(16),
// Define la estructura de la cuadrícula.
gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// Muestra 2 columnas en la cuadrícula.
crossAxisCount: 2,
// Espacio entre las columnas.
crossAxisSpacing: 16,
// Espacio entre las filas.
mainAxisSpacing: 16,
),
// La cantidad de elementos en la cuadrícula. Es la longitud de la lista de imágenes.
itemCount: imageAssets.length,
// itemBuidler es una función que se llama para cada elemento de la cuadrícula.
// index es la posición del elemento actual en la lista.
itemBuilder: (context, index) {
// InkWell es un widget que hace que su hijo sea "táctil" y muestre un efecto de salpicadura de tinta al ser presionado.
return InkWell(
// La función que se ejecuta al presionar el InkWell. Llama al método _showImageDialog con la ruta de la imagen correcta.
onTap: () => _showImageDialog(context, imageAssets[index]),
// Card es un widget que representa una tarjeta de Material Design con esquinas redondeadas y sombra.
child: Card(
// La elevación de la tarjeta, que controla la sombra.
elevation: 4,
// ClipRRect corta el widget hijo (la imagen) en forma de un rectángulo con esquinas redondeadas.
child: ClipRRect(
// Define el radio de las esquinas redondeadas.
borderRadius: BorderRadius.circular(8),
// Muestra la imagen.
child: Image.asset(
// La ruta de la imagen actual en la lista.
imageAssets[index],
// Asegura que la imagen cubra el espacio disponible.
fit: BoxFit.cover,
// Si la imagen no se puede cargar, muestra un icono de error en el centro.
errorBuilder: (context, error, stackTrace) {
return const Center(child: Icon(Icons.error));
},
),
),
),
);
},
),
);
}
}






