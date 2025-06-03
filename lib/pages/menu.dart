import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MENÚ'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const Text(
              'SELECCIONE UN APARTADO',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 20),

            // 🔹 Botones del menú
            _buildButton(context, 'INTRODUCCIÓN', '/introduccion'),
            _buildButton(context, 'ANTECEDENTES', '/antecedentes'),
            _buildButton(context, 'PLANOS', '/planos'),
            _buildButton(context, 'PERTH', '/perth'),
            _buildButton(context, 'COSTOS', '/costos'),
            _buildButton(context, 'CÁLCULOS', '/calculos'),
            _buildButton(context, 'ESTADÍSTICAS', '/estadisticas'),
            _buildButton(context, 'HISTORIAL', '/historial'),

            const SizedBox(height: 40),

            // 🔙 Botón ATRÁS
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/portada');
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
              child: const Text('ATRÁS', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  // 🔧 Widget para evitar repetir código
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
