// Este es el punto de entrada de la aplicación.
// Contiene la configuración inicial y la página de inicio.

import 'package:flutter/material.dart';

// Importa las pantallas principales a las que se navegará desde este archivo.
import 'practicas_screen.dart';
import 'proyecto_screen.dart';
import 'ajustes_screen.dart';
import 'app_drawer.dart';

void main() {
  runApp(const MyApp());
}

// MyApp es el widget raíz. Maneja el tema y la navegación.
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Maneja el tema de la aplicación para el modo oscuro
  ThemeMode _themeMode = ThemeMode.system;

  void _changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portafolio de Prácticas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      themeMode: _themeMode,
      // Define las rutas para la navegación
      routes: {
        '/': (context) => const HomeScreen(),
        '/practicas': (context) => const PracticasScreen(),
        '/proyecto': (context) => const ProyectoScreen(),
        '/ajustes': (context) => AjustesScreen(changeTheme: _changeTheme),
      },
    );
  }
}

// La pantalla de inicio que servirá como un menú principal.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Portafolio de Prácticas')),
      drawer: const AppDrawer(), // Agrega el menú lateral (Drawer)
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Título de bienvenida
              const Text(
                '¡Bienvenido a mi Portafolio de Prácticas en Flutter!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              // Botones que te llevarán a las secciones principales
              _buildButton(
                context,
                'Mis Prácticas',
                Icons.code,
                () => Navigator.pushNamed(context, '/practicas'),
              ),
              _buildButton(
                context,
                'Mis Proyectos',
                Icons.folder,
                () => Navigator.pushNamed(context, '/proyecto'),
              ),
              _buildButton(
                context,
                'Ajustes',
                Icons.settings,
                () => Navigator.pushNamed(context, '/ajustes'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget para crear un botón de navegación
  Widget _buildButton(BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton.icon(
        onPressed: onTap,
        icon: Icon(icon, size: 24),
        label: Text(title, style: const TextStyle(fontSize: 18)),
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}