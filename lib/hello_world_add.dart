// Esta pantalla permite al usuario agregar mensajes de "Hola Mundo"
// de forma dinámica al presionar un botón flotante.

import 'package:flutter/material.dart';
//import 'app_drawer.dart'; // Importa el menú lateral

// HelloWorldAddScreen es un StatefulWidget porque su contenido (la lista de mensajes)
// cambiará con el tiempo.
class HelloWorldAddScreen extends StatefulWidget {
  const HelloWorldAddScreen({super.key});

  @override
  State<HelloWorldAddScreen> createState() => _HelloWorldAddScreenState();
}

// El estado de la pantalla.
class _HelloWorldAddScreenState extends State<HelloWorldAddScreen> {
  // Una lista para almacenar los mensajes de "Hola Mundo".
  // Está vacía al principio.
  List<String> helloWorldMessages = [];

  // Función para agregar un nuevo mensaje a la lista.
  void addHelloWorld() {
    // setState notifica a Flutter que el estado ha cambiado,
    // lo que provoca que el widget se redibuje.
    setState(() {
      helloWorldMessages.add('Hola Mundo ${helloWorldMessages.length + 1}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Agregar Hola Mundo')),
      // Agrega el menú lateral a esta pantalla.
      //drawer: const AppDrawer(),
       
      // Botón flotante en la esquina inferior derecha.
      floatingActionButton: FloatingActionButton(
        onPressed: addHelloWorld, // Llama a la función al ser presionado.
        child: const Icon(Icons.add), // Icono de "más" en el botón.
      ),
      // Muestra un mensaje si la lista está vacía, de lo contrario, muestra la lista.
      body: helloWorldMessages.isEmpty
          ? const Center(child: Text('Presiona "+" para agregar mensajes'))
          : ListView.builder(
              itemCount: helloWorldMessages.length, // Número de elementos en la lista.
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  helloWorldMessages[index], // Muestra el mensaje de la lista.
                  style: const TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
    );
  }
}
