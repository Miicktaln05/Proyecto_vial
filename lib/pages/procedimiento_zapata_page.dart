import 'package:flutter/material.dart';
import '../models/resultado_zapata.dart';

class ProcedimientoZapataPage extends StatelessWidget {
  final ResultadoZapata resultado;
  final double carga;

  const ProcedimientoZapataPage({
    super.key,
    required this.resultado,
    required this.carga,
  });

  @override
  Widget build(BuildContext context) {
    final double resistencia = resultado.resistencia;
    final double factor = resultado.factor;
    final double area = resultado.area;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Procedimiento de Cálculo'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const Text(
              '📝 Procedimiento del cálculo de zapatas:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text('1. Carga total: $carga kN'),
            Text('2. Resistencia del suelo: $resistencia kN/m²'),
            Text('3. Factor de seguridad: $factor'),
            const SizedBox(height: 20),
            const Text('🔢 Fórmula usada:'),
            const Text('Área = (Carga × Factor de seguridad) ÷ Resistencia del suelo'),
            const SizedBox(height: 10),
            Text(
              'Área = (${carga.toStringAsFixed(2)} × ${factor.toStringAsFixed(2)}) ÷ ${resistencia.toStringAsFixed(2)}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Área = ${area.toStringAsFixed(2)} m²',
              style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}