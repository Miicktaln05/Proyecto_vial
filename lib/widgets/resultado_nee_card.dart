import 'package:flutter/material.dart';
import '../controllers/calculo_nee_controller.dart';

class ResultadoNEECard extends StatelessWidget {
  final ResultadoNEE resultado;

  const ResultadoNEECard({super.key, required this.resultado});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 16),
      elevation: 4,
      color: Colors.deepPurple.shade50,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Resultado del Cálculo',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 12),
            const Text(
              'Nota: por cada tipo de vehículo y dependiendo del tipo de camino.',
              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 8),
            const Text(
              '⚠️ Este factor se considera por solo auto de este tipo seleccionado.',
              style: TextStyle(color: Colors.red),
            ),
            const SizedBox(height: 16),
            Text('FE total Autobuses: ${resultado.feTotalAutobuses.toStringAsFixed(2)}'),
            Text('FE total Carga: ${resultado.feTotalCarga.toStringAsFixed(2)}'),
            Text('FE Global: ${resultado.feGlobal.toStringAsFixed(2)}'),
            Text('Factor total: ${resultado.factorTotal.toStringAsFixed(4)}'),
            const SizedBox(height: 8),
            Text(
              'NEE: ${resultado.nee.toStringAsFixed(2)}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
