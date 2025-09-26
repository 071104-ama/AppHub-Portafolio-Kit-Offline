// Esta pantalla muestra un botón que, al ser presionado,
// alterna la visibilidad de una lista de 10 mensajes.

import 'package:flutter/material.dart';
//import 'app_drawer.dart'; // Importa el menú lateral

// HelloWorldTenTimesScreen es un StatefulWidget porque su estado (si los
// mensajes se muestran o no) cambiará.
class HelloWorldTenTimesScreen extends StatefulWidget {
  const HelloWorldTenTimesScreen({super.key});

  @override
  State<HelloWorldTenTimesScreen> createState() => _HelloWorldTenTimesScreenState();
}

// El estado de la pantalla.
class _HelloWorldTenTimesScreenState extends State<HelloWorldTenTimesScreen> {
  // Una variable booleana para controlar la visibilidad de los mensajes.
  // Es 'false' por defecto, por lo que los mensajes están ocultos al inicio.
  bool showMessages = false;

  // Una lista de 10 mensajes de "Hola Mundo" generados de una vez.
  final List<String> messages = List.generate(10, (index) => 'Hola Mundo ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('10 Hola Mundo'),
      ),
      //drawer: const AppDrawer(), // Agrega el menú lateral.
      body: Column(
        children: [
          const SizedBox(height: 20), // Espacio vertical
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Al presionar el botón, se cambia el estado.
                // setState notifica a Flutter que la UI debe actualizarse.
                setState(() {
                  // Cambia el valor de `showMessages` a su opuesto.
                  showMessages = !showMessages;
                });
              },
              // El texto del botón cambia según el valor de `showMessages`.
              child: Text(showMessages ? 'Ocultar Hola Mundo' : 'Mostrar Hola Mundo'),
            ),
          ),
          const SizedBox(height: 20), // Espacio vertical
          // Un `if` simple para mostrar u ocultar la lista.
          if (showMessages)
            // `Expanded` hace que la lista ocupe el espacio restante.
            Expanded(
              child: ListView.builder(
                itemCount: messages.length, // Número de elementos en la lista.
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    messages[index], // Muestra cada mensaje.
                    style: const TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
        ],
      )
    );
  }
}
