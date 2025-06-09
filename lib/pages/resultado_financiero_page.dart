import 'package:flutter/material.dart';
import 'package:proyecto_vial/utils/exportar_excel.dart';

class ResultadoFinancieroPage extends StatelessWidget {
  final double vna;
  final double tir;
  final double vac;
  final double cae;
  final double vf;

  const ResultadoFinancieroPage({
    super.key,
    required this.vna,
    required this.tir,
    required this.vac,
    required this.cae,
    required this.vf,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado Financiero'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Text('✅ Valor Neto Actual (VNA): \$${vna.toStringAsFixed(2)}', style: const TextStyle(fontSize: 16)),
            Text('💹 Tasa Interna de Retorno (TIR): ${tir.toStringAsFixed(2)}%', style: const TextStyle(fontSize: 16)),
            Text('📈 Variación al Finalizar (VAC): \$${vac.toStringAsFixed(2)}', style: const TextStyle(fontSize: 16)),
            Text('📉 Costo Anual Equivalente (CAE): \$${cae.toStringAsFixed(2)}', style: const TextStyle(fontSize: 16)),
            Text('📊 Valor Futuro (VF): \$${vf.toStringAsFixed(2)}', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () async {
                await ExportadorExcel.guardarExcelFinancieroCompleto(
                  ingresos: 0, // Reemplázalo si quieres conservarlos
                  costos: 0,
                  interes: 0,
                  utilidad: 0,
                  vna: vna,
                  tir: tir,
                  vac: vac,
                  cae: cae,
                  vf: vf,
                );
              },
              icon: const Icon(Icons.file_download),
              label: const Text('Exportar a Excel'),
            )
          ],
        ),
      ),
    );
  }
}