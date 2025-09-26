import 'package:flutter/material.dart';
import 'app_drawer.dart'; 
// Importa tus módulos de prácticas
import 'hello_world_add.dart';
import 'hello_world_ten.dart';
import 'juego_rps.dart';
import 'registro_form.dart';
import 'registro_screen.dart'; // Asegúrate de que este import exista

class PracticasScreen extends StatelessWidget {
  const PracticasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Índice de Prácticas'),
      ),
      drawer: const AppDrawer(),
      body: ListView(
        children: [
          _buildPracticeTile(context, 'Práctica 1: Agregar \"Hola Mundo\"', const HelloWorldAddScreen()),
          _buildPracticeTile(context, 'Práctica 2: 10 \"Hola Mundo\"', const HelloWorldTenTimesScreen()),
          _buildPracticeTile(context, 'Práctica 3: Juego RPS', const JuegoRPS()),
         
          // Ahora navega a RegistroScreen, que ya contiene un Scaffold.
          _buildPracticeTile(context, 'Práctica 4: Formulario de Registro', const RegistroScreen()),
        ],
      ),
    );
  }

  Widget _buildPracticeTile(BuildContext context, String title, Widget destination) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: ListTile(
        title: Text(title),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          Navigator.push(
            context,
          MaterialPageRoute(builder: (context) => destination),
          );
        },
      ),
    );
  }
}