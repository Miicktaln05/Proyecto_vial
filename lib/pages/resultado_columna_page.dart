import 'package:flutter/material.dart';
import '../models/resultado_columna.dart';

class ResultadoColumnaPage extends StatelessWidget {
  final ResultadoColumna resultado;

  const ResultadoColumnaPage({super.key, required this.resultado});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado Final - Columna'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '📊 Resultado del cálculo:',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '🔸 Carga: ${resultado.carga.toStringAsFixed(2)} kN',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              '🔸 Área: ${resultado.area.toStringAsFixed(2)} m²',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              '🔸 Acero: ${resultado.acero.toStringAsFixed(2)} cm²',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}