import 'package:flutter/material.dart';
import '../models/resultado_columna.dart';

class ProcedimientoColumnaPage extends StatelessWidget {
  final ResultadoColumna resultado;
  final double carga;
  final int columnas;

  const ProcedimientoColumnaPage({
    super.key,
    required this.resultado,
    required this.carga,
    required this.columnas,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Procedimiento - Columna'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          '📐 Procedimiento del cálculo:\n\n'
          '🔹 Carga total: ${carga.toStringAsFixed(2)} kN\n'
          '🔹 Columnas: $columnas\n'
          '🔸 Área requerida: ${resultado.area.toStringAsFixed(2)} m²\n'
          '🔸 Acero requerido: ${resultado.acero.toStringAsFixed(2)} cm²\n\n'
          '🧮 Fórmulas aplicadas:\n'
          'A = Carga / (f\'c × φ)\n'
          'As = 0.01 × A (supuesto)\n\n'
          '👷 Este procedimiento es una guía técnica básica.',
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}