import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import '../utils/exportar_pdf.dart';

class ResultadoCurvasPage extends StatelessWidget {
  final double radio;

  const ResultadoCurvasPage({super.key, required this.radio});

  void exportarPDF() async {
    final pdf = await ExportadorPDF.generarPDFGenerico(
      titulo: '📄 Resultado Final - Cálculo de Curva',
      contenido: [
        '✅ Radio mínimo calculado:',
        '${radio.toStringAsFixed(2)} metros',
      ],
    );

    await Printing.layoutPdf(onLayout: (_) => pdf);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado Final'),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('📊 Resultado final del cálculo de curva:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Text('📐 Radio mínimo: ${radio.toStringAsFixed(2)} m',
                style: const TextStyle(fontSize: 22, color: Colors.green, fontWeight: FontWeight.bold)),
            const Spacer(),
            Center(
              child: ElevatedButton.icon(
                onPressed: exportarPDF,
                icon: const Icon(Icons.picture_as_pdf),
                label: const Text('Exportar a PDF'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
              ),
            )
          ],
        ),
      ),
    );
  }
}