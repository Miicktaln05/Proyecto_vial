import 'package:flutter/material.dart';

class MateriaPage extends StatelessWidget {
  const MateriaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MATERIA'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Selecciona un tema:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildButton(context, 'Estructuras', '/estructuras'),
          _buildButton(context, 'Pavimentos', '/calculos'), // Ya la tenemos
          _buildButton(context, 'Caminos', '/caminos'),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context, String label, String route) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: ElevatedButton(
        onPressed: () => Navigator.pushNamed(context, route),
        style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
        child: Text(label, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}