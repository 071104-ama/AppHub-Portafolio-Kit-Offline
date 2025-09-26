// Esta pantalla es la vista que contiene el formulario de registro.
// Es un StatelessWidget ya que su contenido no cambia dinámicamente.

import 'package:flutter/material.dart';
import 'registro_form.dart'; // Importa el widget del formulario
//import 'app_drawer.dart'; // Importa el menú lateral

class RegistroScreen extends StatelessWidget {
  const RegistroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Práctica 4 - Registro')),
      //drawer: const AppDrawer(), // Agrega el menú lateral a la pantalla.
      body: const Padding(
        padding: EdgeInsets.all(16.0), // Agrega un espacio alrededor del formulario.
        child: RegistroForm(), // Muestra el widget del formulario.
      ),
    );
  }
}
