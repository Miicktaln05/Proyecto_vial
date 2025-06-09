import 'dart:math';
import 'package:flutter/material.dart';

class ProcedimientoFinancieroPage extends StatelessWidget {
  final double ingresos;
  final double costos;
  final double interes;
  final double utilidad;
  final double vna;
  final double tir;
  final double vac;
  final double cae;
  final double vf;

  const ProcedimientoFinancieroPage({
    super.key,
    required this.ingresos,
    required this.costos,
    required this.interes,
    required this.utilidad,
    required this.vna,
    required this.tir,
    required this.vac,
    required this.cae,
    required this.vf,
  });

  @override
  Widget build(BuildContext context) {
    final tasaDecimal = interes / 100;
    final meses = (ingresos / 4).round();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Procedimiento Financiero'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            '📘 Procedimiento detallado',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),

          const Text(
            '1️⃣ VNA = ∑ (Flujo de efectivo / (1 + r)^n) - Inversión inicial',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text('🔹 Inversión inicial = \$${costos.toStringAsFixed(2)}'),
          Text('🔹 Tasa (r) = ${interes.toStringAsFixed(2)}% = ${tasaDecimal.toStringAsFixed(4)}'),
          Text('🔹 Utilidad usada como flujo base = \$${utilidad.toStringAsFixed(2)}'),
          const SizedBox(height: 8),

          const Text(
            '📅 Tabla de Flujo por Mes:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Table(
            border: TableBorder.all(color: Colors.grey),
            columnWidths: const {
              0: FixedColumnWidth(60),
              1: FixedColumnWidth(100),
              2: FlexColumnWidth(),
              3: FlexColumnWidth(),
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
                    child: Text('% del costo', style: TextStyle(color: Colors.white)),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Flujo', style: TextStyle(color: Colors.white)),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Flujo / (1+r)^n', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
              ...List.generate(meses, (i) {
                final mes = i + 1;
                final porcentaje = (9 + mes);
                final flujo = costos * (porcentaje / 100);
                final descuento = flujo / pow(1 + tasaDecimal, mes).toDouble();
                return TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('$mes'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('$porcentaje%'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('\$${flujo.toStringAsFixed(2)}'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('\$${descuento.toStringAsFixed(2)}'),
                    ),
                  ],
                );
              }),
            ],
          ),
          const SizedBox(height: 12),
          Text('🔹 Suma de flujos descontados = \$${(vna + costos).toStringAsFixed(2)}'),
          Text('🔹 VNA final = \$${vna.toStringAsFixed(2)}'),
          const SizedBox(height: 24),

          const Text(
            '2️⃣ TIR = Tasa estimada (%)',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text('🔹 TIR = ${tir.toStringAsFixed(2)}%'),
          const SizedBox(height: 24),

          const Text(
            '3️⃣ VAC = BAC - EAC',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text('🔹 BAC (Presupuesto al finalizar) = \$${(costos * 1.1).toStringAsFixed(2)}'),
          Text('🔹 EAC (Estimado actual) = \$${costos.toStringAsFixed(2)}'),
          Text('🔹 VAC = \$${vac.toStringAsFixed(2)}'),
          const SizedBox(height: 24),

          const Text(
            '4️⃣ CAE = [(Costo crédito - Monto) / Monto] × (1 + r)^Años',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text('🔹 Simplificado: CAE = 0'),
          const SizedBox(height: 24),

          const Text(
            '5️⃣ VF = VP × (1 + r)^n',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text('🔹 Valor presente = \$${utilidad.toStringAsFixed(2)}'),
          Text('🔹 Tasa (r) = ${tasaDecimal.toStringAsFixed(4)}'),
          Text('🔹 Meses (n) = $meses'),
          Text('🔹 VF = \$${vf.toStringAsFixed(2)}'),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}