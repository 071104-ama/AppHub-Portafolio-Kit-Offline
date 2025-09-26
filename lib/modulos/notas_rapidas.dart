import 'package:flutter/material.dart';

class NotasRapidasModule extends StatefulWidget {
  const NotasRapidasModule({super.key});

  @override
  State<NotasRapidasModule> createState() => _NotasRapidasModuleState();
}

class _NotasRapidasModuleState extends State<NotasRapidasModule> {
  final List<String> _notes = [];
  final TextEditingController _noteController = TextEditingController();

  void _addNote() {
    if (_noteController.text.isNotEmpty) {
      setState(() {
        _notes.add(_noteController.text);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nota agregada')),
      );
      _noteController.clear();
    }
  }

  void _clearNotes() {
    if (_notes.isNotEmpty) {
      setState(() {
        _notes.clear();
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Todas las notas han sido borradas')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notas Rápidas'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_forever),
            onPressed: _clearNotes,
            tooltip: 'Borrar todas las notas',
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: _notes.isEmpty
                ? const Center(child: Text('No hay notas. Agrega una con el botón "+"'))
                : ListView.builder(
                    itemCount: _notes.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(_notes[index]),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              _notes.removeAt(index);
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Nota borrada')),
                            );
                          },
                        ),
                      );
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _noteController,
                    decoration: const InputDecoration(
                      labelText: 'Escribe una nota',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                FloatingActionButton(
                  onPressed: _addNote,
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
