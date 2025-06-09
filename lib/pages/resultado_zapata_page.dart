import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/resultado_zapata.dart';
import '../utils/exportar_pdf.dart';
import 'package:share_plus/share_plus.dart';

class ResultadoZapataPage extends StatelessWidget {
  final ResultadoZapata resultado;

  const ResultadoZapataPage({super.key, required this.resultado});

  @override
  Widget build(BuildContext context) {
    final String fecha = DateFormat('dd/MM/yyyy – HH:mm').format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado Final - Zapatas'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const Text(
              '📋 Resultado del cálculo de zapatas:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text('📅 Fecha: $fecha'),
            const SizedBox(height: 10),
            Text('🔹 Carga total: ${resultado.carga.toStringAsFixed(2)} kN'),
            Text('🔹 Resistencia del suelo: ${resultado.resistencia.toStringAsFixed(2)} kN/m²'),
            Text('🔹 Factor de seguridad: ${resultado.factor.toStringAsFixed(2)}'),
            const SizedBox(height: 10),
            Text(
              '✅ Área recomendada: ${resultado.area.toStringAsFixed(2)} m²',
              style: const TextStyle(color: Colors.green, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () async {
                final pdf = await ExportadorPDF.generarPDFGenerico(
                  titulo: 'Resultado de Cálculo de Zapatas',
                  contenido: [
                    'Fecha: $fecha',
                    'Carga total: ${resultado.carga.toStringAsFixed(2)} kN',
                    'Resistencia del suelo: ${resultado.resistencia.toStringAsFixed(2)} kN/m²',
                    'Factor de seguridad: ${resultado.factor.toStringAsFixed(2)}',
                    'Área recomendada: ${resultado.area.toStringAsFixed(2)} m²',
                  ],
                );

                Share.shareXFiles(
                  [XFile.fromData(pdf, name: 'resultado_zapata.pdf', mimeType: 'application/pdf')],
                  text: '📄 Resultado del cálculo de zapatas',
                );
              },
              icon: const Icon(Icons.picture_as_pdf),
              label: const Text('Exportar PDF'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}