import 'package:flutter/material.dart';

class AjustesScreen extends StatefulWidget {
  final Function(ThemeMode) changeTheme;

  const AjustesScreen({super.key, required this.changeTheme});

  @override
  State<AjustesScreen> createState() => _AjustesScreenState();
}

class _AjustesScreenState extends State<AjustesScreen> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajustes'),
        // La flecha de regreso aparece automáticamente
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Modo Oscuro'),
            value: isDarkMode,
            onChanged: (value) {
              setState(() {
                isDarkMode = value;
              });
              widget.changeTheme(value ? ThemeMode.dark : ThemeMode.light);
            },
            secondary: Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode),
          ),
          ListTile(
            title: const Text('Acerca de'),
            subtitle: const Text('Versión 1.0.0'),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: 'Portafolio Flutter',
                applicationVersion: '1.0.0',
                applicationLegalese: '© 2024 Autor: Gemini',
                children: [
                  const Text('Esta aplicación fue creada como un portafolio para demostrar habilidades en Flutter.'),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}