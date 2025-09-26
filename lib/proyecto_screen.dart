import 'package:flutter/material.dart';
import 'app_drawer.dart';
import 'modulos/notas_rapidas.dart';
import 'modulos/calculadora_imc.dart';
import 'modulos/galeria_local.dart';
import 'modulos/juego_paoi.dart';

class ProyectoScreen extends StatelessWidget {
  const ProyectoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Proyecto: Kit Offline'),
      ),
      drawer: const AppDrawer(),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16),
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: [
          _buildModuleCard(
            context,
            'Notas Rápidas',
            Icons.notes,
            const NotasRapidasModule(),
          ),
          _buildModuleCard(
            context,
            'Calculadora IMC',
            Icons.monitor_weight,
            const CalculadoraImcModule(),
          ),
          _buildModuleCard(
            context,
            'Galería Local',
            Icons.photo_library,
            const GaleriaLocalModule(),
          ),
          _buildModuleCard(
            context,
            'Juego: Par o Impar',
            Icons.games,
            const JuegoPaoiModule(),
          ),
        ],
      ),
    );
  }

  Widget _buildModuleCard(BuildContext context, String title, IconData icon, Widget destination) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          // Utiliza Navigator.push para que cada proyecto tenga una flecha de regreso.
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destination),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Theme.of(context).primaryColor),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}