// 📄 lib/pages/resultado_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/vehiculo_provider.dart';
import '../controllers/calculo_nee_controller.dart';

class ResultadoPage extends StatelessWidget {
  const ResultadoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<VehiculoProvider>(context);
    final resultado = CalculoNEEController.calcular(
      tipoCamino: provider.tipoCamino!,
      tpda: provider.tpda,
      porcentajeLigeros: provider.ligeros,
      porcentajeAutobuses: provider.autobuses,
      porcentajeCarga: provider.carga,
      vehiculos: provider.vehiculos,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('RESULTADOS'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('FACTORES EQUIVALENTES', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            const Text('Por cada tipo de vehículo y dependiendo del tipo de camino se calcula un factor equivalente (FE).'),
            const SizedBox(height: 8),
            const Text(
              'Este factor se considera por solo auto de este tipo seleccionado.',
              style: TextStyle(color: Colors.redAccent, fontStyle: FontStyle.italic),
            ),
            const Divider(height: 32),
            Text('➤ % Total de autobuses y carga: ${(provider.autobuses + provider.carga).toStringAsFixed(2)} %'),
            const SizedBox(height: 8),
            Text('➤ % FE total de autobuses: ${resultado.feTotalAutobuses.toStringAsFixed(4)}'),
            Text('➤ % FE total de carga: ${resultado.feTotalCarga.toStringAsFixed(4)}'),
            const SizedBox(height: 8),
            Text('➤ % FE global: ${resultado.feGlobal.toStringAsFixed(4)}'),
            Text('➤ Factor total: ${resultado.factorTotal.toStringAsFixed(4)}'),
            const SizedBox(height: 8),
            Text('✅ NEE = ${resultado.nee.toStringAsFixed(0)} ejes equivalentes', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
