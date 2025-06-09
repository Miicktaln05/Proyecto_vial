import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import '../utils/exportar_pdf.dart';

class ProcedimientoCurvasPage extends StatelessWidget {
  final double velocidad;
  final double peralte;
  final double friccion;

  const ProcedimientoCurvasPage({
    super.key,
    required this.velocidad,
    required this.peralte,
    required this.friccion,
  });

  void exportarPDF() async {
    final v = velocidad * 1000 / 3600;
    final g = 9.81;
    final r = (v * v) / (g * (peralte + friccion));

    final pdf = await ExportadorPDF.generarPDFGenerico(
      titulo: '📘 Procedimiento del cálculo de curva',
      contenido: [
        'Velocidad: $velocidad km/h',
        'Peralte (e): $peralte',
        'Fricción (f): $friccion',
        '',
        'Fórmula usada:',
        'v = velocidad en m/s = $v',
        'g = gravedad = $g m/s²',
        'Radio R = v² / g(e + f)',
        'Resultado: $r m',
      ],
    );

    await Printing.layoutPdf(onLayout: (_) => pdf);
  }

  @override
  Widget build(BuildContext context) {
    final v = velocidad * 1000 / 3600;
    final g = 9.81;
    final resultado = (v * v) / (g * (peralte + friccion));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Procedimiento'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: ListView(
          children: [
            const Text('📘 Procedimiento paso a paso', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Text('Velocidad ingresada: $velocidad km/h'),
            Text('Peralte: $peralte'),
            Text('Coef. de fricción: $friccion'),
            const SizedBox(height: 16),
            const Text('Fórmula: R = v² / g(e + f)', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('v = ${v.toStringAsFixed(2)} m/s'),
            Text('g = 9.81 m/s²'),
            Text('Resultado: ${resultado.toStringAsFixed(2)} m'),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: exportarPDF,
              icon: const Icon(Icons.picture_as_pdf),
              label: const Text('Exportar procedimiento'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
            ),
          ],
        ),
      ),
    );
  }
}