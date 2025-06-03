// 📄 lib/widgets/resultados_card.dart
import 'package:flutter/material.dart';

class ResultadosCard extends StatelessWidget {
  final double resultado;
  final String tipoVehiculo;
  final String tipoPavimento;
  final int ejes;
  final double peso;
  final int viajes;

  const ResultadosCard({
    super.key,
    required this.resultado,
    required this.tipoVehiculo,
    required this.tipoPavimento,
    required this.ejes,
    required this.peso,
    required this.viajes,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Resultado del cálculo',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const Divider(height: 20, color: Colors.deepPurple),
            Text('Vehículo: $tipoVehiculo'),
            Text('Tipo de pavimento: $tipoPavimento'),
            Text('Número de ejes: $ejes'),
            Text('Peso por eje: ${peso.toStringAsFixed(2)} kg'),
            Text('Número de viajes: $viajes'),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.deepPurple[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Ejes equivalentes: $resultado',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
