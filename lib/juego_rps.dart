// Este archivo contiene la lógica y la interfaz de usuario para
// el juego de Piedra, Papel o Tijera.

import 'dart:math'; // Necesario para generar números aleatorios
import 'package:flutter/material.dart'; // El paquete principal de Flutter
//import 'app_drawer.dart'; // Importa el menú lateral

// JuegoRPS es un StatefulWidget porque el estado del juego (elecciones,
// resultado, puntuaciones) cambiará durante la interacción.
class JuegoRPS extends StatefulWidget {
  const JuegoRPS({super.key});

  @override
  State<JuegoRPS> createState() => _JuegoRPSState();
}

// El estado del widget JuegoRPS.
class _JuegoRPSState extends State<JuegoRPS> {
  // Opciones disponibles para el juego.
  final List<String> opciones = ["Piedra", "Papel", "Tijera"];
  
  // Variables de estado para almacenar las elecciones y el resultado.
  String? eleccionUsuario;
  String? eleccionApp;
  String resultado = "";
  
  // Variables para llevar la puntuación.
  int puntosUsuario = 0;
  int puntosApp = 0;

  // Método para manejar la lógica de una ronda del juego.
  void jugar(String eleccion) {
    // Crea una instancia del generador de números aleatorios.
    final random = Random();
    // La aplicación elige una opción al azar de la lista.
    final appChoice = opciones[random.nextInt(opciones.length)];

    // Actualiza el estado del widget para que la UI se reconstruya.
    setState(() {
      eleccionUsuario = eleccion;
      eleccionApp = appChoice;
      resultado = obtenerResultado(eleccion, appChoice);
    });
  }

  // Método que determina el resultado de la ronda y actualiza los puntos.
  String obtenerResultado(String usuario, String app) {
    if (usuario == app) {
      return "Empate";
    } else if ((usuario == "Piedra" && app == "Tijera") ||
        (usuario == "Papel" && app == "Piedra") ||
        (usuario == "Tijera" && app == "Papel")) {
      puntosUsuario++;
      return "¡Ganaste!";
    } else {
      puntosApp++;
      return "Perdiste";
    }
  }

  // Método para reiniciar el juego.
  void reiniciar() {
    // Reinicia el estado a sus valores iniciales.
    setState(() {
      puntosUsuario = 0;
      puntosApp = 0;
      eleccionUsuario = null;
      eleccionApp = null;
      resultado = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Juego: Piedra, Papel o Tijera")),
      //drawer: const AppDrawer(), // Agrega el menú lateral.
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Elige tu opción:", style: TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            // Fila de botones para que el usuario elija.
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: opciones.map((op) {
                return ElevatedButton(
                  onPressed: () => jugar(op), // Llama a la función `jugar`
                  child: Text(op),
                );
              }).toList(),
            ),
            const SizedBox(height: 30),
            // Muestra las elecciones y el resultado si ya se jugó una ronda.
            if (eleccionUsuario != null && eleccionApp != null) ...[
              Text("Tu elección: $eleccionUsuario",
                  style: const TextStyle(fontSize: 18)),
              Text("Elección de la App: $eleccionApp",
                  style: const TextStyle(fontSize: 18)),
              const SizedBox(height: 10),
              Text(resultado,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold)),
            ],
            const SizedBox(height: 40),
            // Muestra la puntuación actual.
            Text("Marcador", style: Theme.of(context).textTheme.titleLarge),
            Text("Usuario: $puntosUsuario  -  App: $puntosApp",
                style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            // Botón para reiniciar el marcador.
            ElevatedButton(
              onPressed: reiniciar,
              child: const Text("Reiniciar marcador"),
            )
          ],
        ),
      ),
    );
  }
}
