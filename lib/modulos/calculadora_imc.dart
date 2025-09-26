// Archivo: modulos/calculadora_imc.dart

import 'package:flutter/material.dart';

// Este widget es 'stateful' porque su contenido (los valores de los campos de texto)
// cambiará con la interacción del usuario.
class CalculadoraImcModule extends StatefulWidget {
const CalculadoraImcModule({super.key});

 @override
 State<CalculadoraImcModule> createState() => _CalculadoraImcModuleState();
}

// La clase de estado asociada a CalculadoraImcModule.
class _CalculadoraImcModuleState extends State<CalculadoraImcModule> {
 // Una clave global para identificar de forma única el widget Form y validar sus campos.
 final _formKey = GlobalKey<FormState>();
 
 // Controladores para obtener el texto ingresado en los campos de estatura y peso.
 final _heightController = TextEditingController();
 final _weightController = TextEditingController();

 // Método para calcular el IMC y mostrar el resultado en un SnackBar.
 void _calculateImc() {
 // Verifica si el formulario es válido (si los campos cumplen con la validación).
 if (_formKey.currentState!.validate()) {
 // Convierte los valores de texto a números de tipo double.
 final double height = double.parse(_heightController.text);
 final double weight = double.parse(_weightController.text); 
// Calcula el IMC con la fórmula: peso / (estatura * estatura).
final double imc = weight / (height * height);

 String category;
 // Determina la categoría de peso según el valor del IMC.
 if (imc < 18.5) {
 category = 'Bajo peso';
 } else if (imc >= 18.5 && imc < 25) {
 category = 'Normal';
 } else if (imc >= 25 && imc < 30) {
 category = 'Sobrepeso';
 } else {
 category = 'Obesidad';
 }

 // Muestra el resultado del IMC y su categoría en un SnackBar.
 ScaffoldMessenger.of(context).showSnackBar(
 SnackBar(
content: Text('Tu IMC es: ${imc.toStringAsFixed(2)} - Categoría: $category'),
),
 );
 } }

// Método para limpiar los campos de texto y el estado del formulario.
void _resetForm() {
 _formKey.currentState!.reset();
 _heightController.clear();
 _weightController.clear();
 }

 // El método 'build' construye la interfaz de usuario.
 @override
 Widget build(BuildContext context) {
return Scaffold(
 appBar: AppBar(
 title: const Text('Calculadora de IMC'),
 ),
 body: Padding(
 padding: const EdgeInsets.all(16.0),
 child: Form(
 key: _formKey,
 child: Column(
 children: [
 // Campo para la estatura.
 TextFormField(
   controller: _heightController,
 keyboardType: TextInputType.number,
decoration: const InputDecoration(
 labelText: 'Estatura (m)',
 border: OutlineInputBorder(),
 ),
 validator: (value) {
 if (value == null || value.isEmpty) {
 return 'Por favor, ingresa tu estatura';
 }
 final number = double.tryParse(value);
 if (number == null || number <= 0) {
 return 'Ingresa un número válido y positivo';
 }
 return null;
 },
 ),
 const SizedBox(height: 16),
 // Campo para el peso.
 TextFormField(
 controller: _weightController,
 keyboardType: TextInputType.number,
 decoration: const InputDecoration(
 labelText: 'Peso (kg)',
 border: OutlineInputBorder(),
 ),
 validator: (value) {
 if (value == null || value.isEmpty) {
 return 'Por favor, ingresa tu peso';
 }
 final number = double.tryParse(value);
 if (number == null || number <= 0) {
 return 'Ingresa un número válido y positivo';
 }
 return null;
 },
 ),
 const SizedBox(height: 24),
 // Fila de botones.
 Row(
 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
 children: [
 ElevatedButton(
 onPressed: _calculateImc,
 child: const Text('Calcular IMC'),
 ),
 OutlinedButton(
 onPressed: _resetForm,
 child: const Text('Limpiar'),
 ),
 ],
 ),
 ],
 ),
 ),
 ),
 );
 }
}






