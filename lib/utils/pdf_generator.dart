// 📄 lib/utils/pdf_generator.dart
import 'dart:typed_data';
import 'dart:math' as math;
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import '../controllers/vehiculo_provider.dart';
import '../controllers/calculo_nee_controller.dart';

class PDFGenerator {
  static Future<Uint8List> generarPDF({required VehiculoProvider provider}) async {
    final pdf = pw.Document();
    final tipoCamino = provider.tipoCamino!;
    final resultado = CalculoNEEController.calcular(
      tipoCamino: tipoCamino,
      tpda: provider.tpda,
      porcentajeLigeros: provider.ligeros,
      porcentajeAutobuses: provider.autobuses,
      porcentajeCarga: provider.carga,
      vehiculos: provider.vehiculos,
    );

    pdf.addPage(
      pw.MultiPage(
        build: (context) => [
          pw.Header(level: 0, child: pw.Text('Procedimiento NEE', style: pw.TextStyle(fontSize: 20))),
          pw.Text('Tipo de camino: $tipoCamino'),
          pw.Text('TPDA: ${provider.tpda}'),
          pw.Text('% Ligeros: ${provider.ligeros}'),
          pw.Text('% Autobuses: ${provider.autobuses}'),
          pw.Text('% Carga: ${provider.carga}'),
          pw.SizedBox(height: 10),

          pw.Text('Fórmula: FE = (Carga por eje / 8.165)^4.2', style: pw.TextStyle(fontSize: 12)),
          pw.SizedBox(height: 10),
          pw.Text('Cálculo de FE por vehículo:', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),

          ...provider.vehiculos.map((v) {
            final peso = v.pesos[tipoCamino];
            if (peso is! num || v.porcentaje == 0) return pw.SizedBox();
            final cargaPorEje = peso / v.ejes;
            final fe = cargaPorEje / 8.165;
            final fePotenciado = math.pow(fe, 4.2).toDouble();
            final feTotal = fePotenciado * v.porcentaje;

            return pw.Container(
              margin: const pw.EdgeInsets.symmetric(vertical: 6),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text('Vehículo: ${v.nombre}'),
                  pw.Text('• Peso: ${peso.toStringAsFixed(1)} t'),
                  pw.Text('• Ejes: ${v.ejes}'),
                  pw.Text('• Carga por eje: ${cargaPorEje.toStringAsFixed(2)}'),
                  pw.Text('• FE individual: ${fePotenciado.toStringAsFixed(4)}'),
                  pw.Text('• % Participación: ${v.porcentaje.toStringAsFixed(2)}%'),
                  pw.Text('• Aporta: ${feTotal.toStringAsFixed(4)}'),
                ],
              ),
            );
          }),

          pw.Divider(),
          pw.Text('FE total Autobuses: ${resultado.feTotalAutobuses.toStringAsFixed(4)}'),
          pw.Text('FE total Carga: ${resultado.feTotalCarga.toStringAsFixed(4)}'),
          pw.Text('FE Global: ${resultado.feGlobal.toStringAsFixed(4)}'),
          pw.Text('Factor Total: ${resultado.factorTotal.toStringAsFixed(4)}'),
          pw.SizedBox(height: 10),

          pw.Text('NEE = TPDA × (%Aut + %Carga) × FE × 365 × 20'),
          pw.Text(
            'NEE = ${provider.tpda} × ${(provider.autobuses + provider.carga) / 100} × '
            '${resultado.factorTotal.toStringAsFixed(4)} × 365 × 20',
          ),
          pw.SizedBox(height: 10),
          pw.Text(
            'Resultado Final: ${resultado.nee.toStringAsFixed(0)} ejes equivalentes',
            style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
          ),
        ],
      ),
    );

    return pdf.save();
  }
}
