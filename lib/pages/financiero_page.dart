import 'package:flutter/material.dart';
import 'package:proyecto_vial/pages/procedimiento_financiero_page.dart';
import 'package:proyecto_vial/pages/resultado_financiero_page.dart';
import 'dart:math';

class FinancieroPage extends StatefulWidget {
  const FinancieroPage({super.key});

  @override
  State<FinancieroPage> createState() => _FinancieroPageState();
}

class _FinancieroPageState extends State<FinancieroPage> {
  final TextEditingController semanasController = TextEditingController();
  final TextEditingController costosController = TextEditingController();
  final TextEditingController interesController = TextEditingController();

  int? semanas;
  double? costos;
  double? interes;
  double? utilidad;
  double? vna;
  double? tir;
  double? vac;
  double? cae;
  double? vf;

  void calcularFinanciero() {
    semanas = int.tryParse(semanasController.text);
    costos = double.tryParse(costosController.text);
    interes = double.tryParse(interesController.text);

    if (semanas == null || costos == null || interes == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, llena todos los campos con números válidos.')),
      );
      return;
    }

    utilidad = costos!;
    final tasaDecimal = interes! / 100;

    setState(() {
      final n = (semanas! / 4).round();
      vna = 0;
      for (int i = 1; i <= n; i++) {
        final porcentaje = (9 + i) / 100;
        final flujo = costos! * porcentaje;
        vna = vna! + (flujo / pow(1 + tasaDecimal, i)); // <- CORREGIDO
      }
      vna = vna! - costos!;
      tir = interes;
      vac = costos! * 0.10;
      cae = 0; // simplificado
      vf = costos! * (1 + tasaDecimal);
    });
  }

  @override
  void dispose() {
    semanasController.dispose();
    costosController.dispose();
    interesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final meses = semanas != null ? (semanas! / 4).round() : 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Análisis Financiero'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text('Ingresa los valores financieros:', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 12),
            TextField(
              controller: semanasController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Semanas esperadas',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: costosController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Costos totales (\$)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: interesController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Tasa de interés estimada (%)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: calcularFinanciero,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
              ),
              child: const Text('CALCULAR'),
            ),
            const SizedBox(height: 24),

            if (vna != null && tir != null && vac != null && cae != null && vf != null) ...[
              Text(
                '✅ Resultado VNA: \$${vna!.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 16, color: Colors.green),
              ),
              Text('💹 TIR: ${tir!.toStringAsFixed(2)}%'),
              Text('📈 VAC: \$${vac!.toStringAsFixed(2)}'),
              Text('📉 CAE: \$${cae!.toStringAsFixed(2)}'),
              Text('📊 Valor Futuro: \$${vf!.toStringAsFixed(2)}'),
              const SizedBox(height: 24),

              const Text('📅 Tabla de Costos por Mes', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Table(
                border: TableBorder.all(color: Colors.grey),
                columnWidths: const {
                  0: FixedColumnWidth(80),
                  1: FixedColumnWidth(120),
                  2: FlexColumnWidth(),
                },
                children: [
                  const TableRow(
                    decoration: BoxDecoration(color: Colors.deepPurple),
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Mes', style: TextStyle(color: Colors.white)),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Porcentaje (%)', style: TextStyle(color: Colors.white)),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Costo del mes', style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                  ...List.generate(meses, (i) {
                    final mes = i + 1;
                    final porcentaje = 9 + mes;
                    final costoMes = costos! * (porcentaje / 100);
                    return TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('$mes'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('$porcentaje %'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('\$${costoMes.toStringAsFixed(2)}'),
                        ),
                      ],
                    );
                  }),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ResultadoFinancieroPage(
                        vna: vna!,
                        tir: tir!,
                        vac: vac!,
                        cae: cae!,
                        vf: vf!,
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.bar_chart),
                label: const Text('Resultado Financiero'),
              ),
              const SizedBox(height: 12),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProcedimientoFinancieroPage(
                        ingresos: semanas!.toDouble(),
                        costos: costos!,
                        interes: interes!,
                        utilidad: utilidad!,
                        vna: vna!,
                        tir: tir!,
                        vac: vac!,
                        cae: cae!,
                        vf: vf!,
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.description),
                label: const Text('Ver procedimiento'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}