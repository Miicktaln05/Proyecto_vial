// 📄 lib/pages/procedimiento_page.dart
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:printing/printing.dart';

import '../controllers/vehiculo_provider.dart';
import '../controllers/calculo_nee_controller.dart';
import '../utils/pdf_generator.dart';

class ProcedimientoPage extends StatelessWidget {
  const ProcedimientoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<VehiculoProvider>(context);
    final tipoCamino = provider.tipoCamino!;

    final resultado = CalculoNEEController.calcular(
      tipoCamino: tipoCamino,
      tpda: provider.tpda,
      porcentajeLigeros: provider.ligeros,
      porcentajeAutobuses: provider.autobuses,
      porcentajeCarga: provider.carga,
      vehiculos: provider.vehiculos,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('PROCEDIMIENTO'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            '🧾 Procedimiento paso a paso para el cálculo del NEE',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Divider(height: 24),

          Text('1️⃣ Tipo de camino seleccionado: $tipoCamino'),
          Text('2️⃣ TPDA ingresado: ${provider.tpda}'),
          Text('3️⃣ % de vehículos ligeros: ${provider.ligeros}'),
          Text('4️⃣ % de autobuses: ${provider.autobuses}'),
          Text('5️⃣ % de vehículos de carga: ${provider.carga}'),
          const SizedBox(height: 12),

          const Text(
            '📘 Fórmula del Factor Equivalente (FE):',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text('FE = (Carga por eje / 8.165)^4.2'),
          const SizedBox(height: 12),

          const Text(
            '📊 Cálculo de FE por tipo de vehículo:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),

          ...provider.vehiculos.map((v) {
            final peso = v.pesos[tipoCamino];
            if (peso is! num || v.porcentaje == 0) return const SizedBox.shrink();

            final cargaPorEje = peso / v.ejes;
            final fe = cargaPorEje / 8.165;
            final fePotenciado = math.pow(fe, 4.2).toDouble();
            final feTotal = fePotenciado * v.porcentaje;

            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('🚛 Vehículo: ${v.nombre}', style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text('• Peso: ${peso.toStringAsFixed(1)} toneladas'),
                    Text('• Ejes: ${v.ejes}'),
                    Text('• Carga por eje: ${cargaPorEje.toStringAsFixed(2)}'),
                    Text('• FE individual: ${fePotenciado.toStringAsFixed(4)}'),
                    Text('• % Participación: ${v.porcentaje.toStringAsFixed(2)}%'),
                    Text('• Aportación al total: ${feTotal.toStringAsFixed(4)}'),
                  ],
                ),
              ),
            );
          }),

          const SizedBox(height: 16),
          const Divider(height: 24),
          Text('🧮 FE total de autobuses: ${resultado.feTotalAutobuses.toStringAsFixed(4)}'),
          Text('🧮 FE total de vehículos de carga: ${resultado.feTotalCarga.toStringAsFixed(4)}'),
          Text('🧮 FE Global: ${resultado.feGlobal.toStringAsFixed(4)}'),
          Text('🧮 Factor Total: ${resultado.factorTotal.toStringAsFixed(4)}'),

          const SizedBox(height: 20),
          const Text(
            '📘 Fórmula final del NEE:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text('NEE = TPDA × (% Autobuses + % Carga) × FE Total × 365 × 20'),
          const SizedBox(height: 8),
          Text(
            'NEE = ${provider.tpda} × ${(provider.autobuses + provider.carga) / 100} × '
            '${resultado.factorTotal.toStringAsFixed(4)} × 365 × 20',
          ),

          const SizedBox(height: 16),
          Text(
            '✅ Resultado Final: ${resultado.nee.toStringAsFixed(0)} ejes equivalentes',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final pdf = await PDFGenerator.generarPDF(provider: provider);
          await Printing.layoutPdf(onLayout: (_) => pdf);
        },
        icon: const Icon(Icons.picture_as_pdf),
        label: const Text('Exportar PDF'),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}
