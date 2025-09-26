// Este es el widget de formulario con estado (StatefulWidget)
// que maneja los campos de texto, la validación y los botones.

import 'package:flutter/material.dart';

class RegistroForm extends StatefulWidget {
  const RegistroForm({super.key});

  @override
  State<RegistroForm> createState() => _RegistroFormState();
}

class _RegistroFormState extends State<RegistroForm> {
  // Una clave global para el formulario, necesaria para validar los campos.
  final _formKey = GlobalKey<FormState>();

  // Controladores para obtener el texto de los campos de entrada.
  final _nombreController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  // Variables de estado para controlar la visibilidad de la contraseña y el checkbox.
  bool _obscurePassword = true;
  bool _aceptaTerminos = false;

  // Función que se ejecuta al presionar el botón "Enviar".
  void _enviar() {
    // Valida todos los campos del formulario.
    final esValido = _formKey.currentState!.validate();

    // Si el usuario no ha aceptado los términos, muestra un mensaje de error.
    if (!_aceptaTerminos) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Debe aceptar los términos y condiciones')),
      );
      return; // Detiene la función si el checkbox no está marcado.
    }

    // Si la validación del formulario es exitosa...
    if (esValido) {
      final nombre = _nombreController.text;
      final email = _emailController.text;

      // Muestra un mensaje de éxito con los datos ingresados.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registrado: $nombre ($email)')),
      );
    }
  }

  // Función para limpiar todos los campos del formulario.
  void _limpiar() {
    _formKey.currentState!.reset(); // Resetea el estado del formulario.
    _nombreController.clear();
    _emailController.clear();
    _passwordController.clear();
    _confirmPasswordController.clear();
    setState(() {
      _obscurePassword = true;
      _aceptaTerminos = false;
    });
  }

  // Limpia los controladores cuando el widget se elimina del árbol.
  @override
  void dispose() {
    _nombreController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: Column(
        children: [
          // Campo de texto para el nombre.
          TextFormField(
            controller: _nombreController,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              labelText: 'Nombre',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'El nombre es obligatorio';
              } else if (value.length < 3) {
                return 'Debe tener al menos 3 caracteres';
              }
              return null;
            },
          ),
          const SizedBox(height: 12),
          // Campo de texto para el email.
          TextFormField(
            controller: _emailController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.email),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'El email es obligatorio';
              } else if (!RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$').hasMatch(value)) {
                return 'Formato de email inválido';
              }
              return null;
            },
          ),
          const SizedBox(height: 12),
          // Campo de texto para la contraseña.
          TextFormField(
            controller: _passwordController,
            textInputAction: TextInputAction.next,
            obscureText: _obscurePassword,
            decoration: InputDecoration(
              labelText: 'Contraseña',
              border: const OutlineInputBorder(),
              prefixIcon: const Icon(Icons.lock),
              // Botón para mostrar/ocultar la contraseña.
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'La contraseña es obligatoria';
              } else if (value.length < 6) {
                return 'Debe tener al menos 6 caracteres';
              }
              return null;
            },
          ),
          const SizedBox(height: 12),
          // Campo de texto para confirmar la contraseña.
          TextFormField(
            controller: _confirmPasswordController,
            textInputAction: TextInputAction.done,
            obscureText: _obscurePassword,
            decoration: const InputDecoration(
              labelText: 'Confirmar contraseña',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.lock_outline),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Confirme su contraseña';
              } else if (value != _passwordController.text) {
                return 'Las contraseñas no coinciden';
              }
              return null;
            },
          ),
          const SizedBox(height: 12),
          // Checkbox de términos y condiciones.
          CheckboxListTile(
            title: const Text('Acepto los términos y condiciones'),
            value: _aceptaTerminos,
            onChanged: (value) {
              setState(() {
                _aceptaTerminos = value ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            contentPadding: EdgeInsets.zero,
          ),
          const SizedBox(height: 20),
          // Botones de Enviar y Limpiar.
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: _enviar,
                child: const Text('Enviar'),
              ),
              OutlinedButton(
                onPressed: _limpiar,
                child: const Text('Limpiar'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
