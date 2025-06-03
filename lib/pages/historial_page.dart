import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:printing/printing.dart';

import '../controllers/historial_controller.dart';
import '../models/resultado_model.dart';
import '../utils/exportar_pdf.dart';

class HistorialPage extends StatelessWidget {
  const HistorialPage({super.key});

  @override
  Widget build(BuildContext context) {
    final historial = Provider.of<HistorialController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial de Cálculos'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_forever),
            tooltip: 'Limpiar historial',
            onPressed: () async {
              final confirm = await showDialog<bool>(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text('¿Borrar historial?'),
                  content: const Text('¿Estás seguro de eliminar todos los resultados?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: const Text('Cancelar'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: const Text('Borrar'),
                    ),
                  ],
                ),
              );

              if (confirm == true) {
                await historial.limpiarHistorial();
              }
            },
          )
        ],
      ),
      body: historial.resultados.isEmpty
          ? const Center(child: Text('No hay resultados guardados.'))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: historial.resultados.length,
              itemBuilder: (context, index) {
                final res = historial.resultados[index];
                final fecha = DateFormat('dd/MM/yyyy – HH:mm').format(res.fecha);

                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.only(bottom: 12),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Vehículo: ${res.tipoVehiculo}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('Pavimento: ${res.tipoPavimento}'),
                        Text('Ejes: ${res.ejes}, Peso: ${res.peso} kg'),
                        Text('Viajes: ${res.viajes}'),
                        const SizedBox(height: 8),
                        Text('Resultado: ${res.resultado.toStringAsFixed(2)} ejes equivalentes'),
                        const SizedBox(height: 4),
                        Text('Fecha: $fecha', style: const TextStyle(fontSize: 12, color: Colors.grey)),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton.icon(
                              onPressed: () async {
                                final pdf = await ExportadorPDF.generarPDF(
                                  tipoVehiculo: res.tipoVehiculo,
                                  tipoPavimento: res.tipoPavimento,
                                  ejes: res.ejes,
                                  peso: res.peso,
                                  viajes: res.viajes,
                                  resultado: res.resultado,
                                  fecha: fecha,
                                );
                                await Printing.layoutPdf(onLayout: (_) => pdf);
                              },
                              icon: const Icon(Icons.picture_as_pdf, size: 18),
                              label: const Text('Exportar PDF'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepPurple,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              ),
                            ),
                            const SizedBox(width: 12),
                            ElevatedButton.icon(
                              onPressed: () {
                                final texto = '''
🚧 Resultado de Cálculo - Proyecto Periférico 🚧

📌 Vehículo: ${res.tipoVehiculo}
🛣️ Pavimento: ${res.tipoPavimento}
🔧 Ejes: ${res.ejes}
⚖️ Peso por eje: ${res.peso} kg
🚚 Viajes: ${res.viajes}
✅ Resultado: ${res.resultado.toStringAsFixed(2)} ejes equivalentes
📅 Fecha: $fecha
                                ''';

                                Share.share(texto, subject: 'Resultado de cálculo vial');
                              },
                              icon: const Icon(Icons.share, size: 18),
                              label: const Text('Compartir'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
