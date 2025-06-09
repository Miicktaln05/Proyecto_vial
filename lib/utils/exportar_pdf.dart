import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class ExportadorPDF {
  static Future<Uint8List> generarPDF({
    required String tipoVehiculo,
    required String tipoPavimento,
    required int ejes,
    required double peso,
    required int viajes,
    required double resultado,
    required String fecha,
  }) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text('📄 Resultado de Cálculo de Ejes Equivalentes',
                  style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 16),
              pw.Text('📅 Fecha: $fecha'),
              pw.Text('📌 Vehículo: $tipoVehiculo'),
              pw.Text('🛣 Pavimento: $tipoPavimento'),
              pw.Text('🔧 Ejes: $ejes'),
              pw.Text('⚖ Peso por eje: ${peso.toStringAsFixed(2)} kg'),
              pw.Text('🚚 Viajes: $viajes'),
              pw.SizedBox(height: 12),
              pw.Text('✅ Resultado: ${resultado.toStringAsFixed(2)} ejes equivalentes',
                  style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold)),
            ],
          );
        },
      ),
    );

    return pdf.save();
  }

  static Future<Uint8List> generarPDFGenerico({
    required String titulo,
    required List<String> contenido,
  }) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(titulo,
                style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 16),
            ...contenido.map((linea) => pw.Text(linea)),
          ],
        ),
      ),
    );

    return pdf.save();
  }
}