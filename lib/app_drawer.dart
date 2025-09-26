// Este widget crea el menú de navegación lateral reutilizable (Drawer).

import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text(
              'Menú de Navegación',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          ListTile(
            title: const Text('Inicio'),
            onTap: () {
              // Navega de regreso a la ruta inicial y elimina las rutas anteriores.
              Navigator.pushNamedAndRemoveUntil(context, '/', (Route<dynamic> route) => false);
            },
          ),
          ListTile(
            title: const Text('Prácticas'),
            onTap: () {
              Navigator.pushNamed(context, '/practicas');
            },
          ),
          ListTile(
            title: const Text('Proyectos'),
            onTap: () {
              Navigator.pushNamed(context, '/proyecto');
            },
          ),
          ListTile(
            title: const Text('Ajustes'),
            onTap: () {
              Navigator.pushNamed(context, '/ajustes');
            },
          ),
        ],
      ),
    );
  }
}