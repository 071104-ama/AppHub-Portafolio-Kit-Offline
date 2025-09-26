import 'package:flutter/material.dart';
import 'dart:math';

class JuegoPaoiModule extends StatefulWidget {
  const JuegoPaoiModule({super.key});

  @override
  State<JuegoPaoiModule> createState() => _JuegoPaoiModuleState();
}

class _JuegoPaoiModuleState extends State<JuegoPaoiModule> {
  String? _userChoice;
  int? _userNumber;
  int _cpuNumber = 0;
  String _result = '';
  int _userScore = 0;
  int _cpuScore = 0;
  final Random _random = Random();

  void _playGame() {
    if (_userChoice == null || _userNumber == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, elige Par/Impar y un número')),
      );
      return;
    }

    _cpuNumber = _random.nextInt(6); // 0-5
    final total = _userNumber! + _cpuNumber;
    final isEven = total % 2 == 0;
    
    setState(() {
      if ((_userChoice == 'Par' && isEven) || (_userChoice == 'Impar' && !isEven)) {
        _result = '¡Ganaste! La suma es $total.';
        _userScore++;
      } else {
        _result = 'Perdiste. La suma es $total.';
        _cpuScore++;
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(_result)),
    );
  }

  void _resetGame() {
    setState(() {
      _userScore = 0;
      _cpuScore = 0;
      _userChoice = null;
      _userNumber = null;
      _result = '';
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Marcador reiniciado')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Juego: Par o Impar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Elige Par o Impar:',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            ToggleButtons(
              isSelected: ['Par', 'Impar'].map((e) => e == _userChoice).toList(),
              onPressed: (index) {
                setState(() {
                  _userChoice = ['Par', 'Impar'][index];
                });
              },
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('Par'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('Impar'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Elige un número (0-5):',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8.0,
              children: List.generate(6, (index) {
                return ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _userNumber = index;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _userNumber == index ? Theme.of(context).primaryColor : null,
                    foregroundColor: _userNumber == index ? Colors.white : null,
                  ),
                  child: Text('$index'),
                );
              }),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _playGame,
              child: const Text('Jugar'),
            ),
            const SizedBox(height: 24),
            Text(
              'Marcador:',
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            Text(
              'Tú: $_userScore vs CPU: $_cpuScore',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            OutlinedButton(
              onPressed: _resetGame,
              child: const Text('Reiniciar Marcador'),
            ),
          ],
        ),
      ),
    );
  }
}
