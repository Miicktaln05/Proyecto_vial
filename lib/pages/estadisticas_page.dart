import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';

import '../controllers/historial_controller.dart';
import '../models/resultado_model.dart';

class EstadisticasPage extends StatelessWidget {
  const EstadisticasPage({super.key});

  @override
  Widget build(BuildContext context) {
    final historial = Provider.of<HistorialController>(context);
    final resultados = historial.resultados;

    final total = resultados.length;
    final promedio = total == 0
        ? 0.0
        : resultados.map((r) => r.resultado).reduce((a, b) => a + b) / total;

    final porPavimento = <String, int>{};
    final porVehiculo = <String, int>{};

    for (var r in resultados) {
      porPavimento[r.tipoPavimento] = (porPavimento[r.tipoPavimento] ?? 0) + 1;
      porVehiculo[r.tipoVehiculo] = (porVehiculo[r.tipoVehiculo] ?? 0) + 1;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Estadísticas de Resultados'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: resultados.isEmpty
          ? const Center(child: Text('No hay datos para mostrar.'))
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text('Total de cálculos: $total', style: TextStyle(fontSize: 16)),
                  Text('Promedio de ejes equivalentes: ${promedio.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 16)),
                  const SizedBox(height: 24),
                  const Text('Distribución por tipo de pavimento', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 200, child: PavimentoChart()),
                  const SizedBox(height: 24),
                  const Text('Distribución por tipo de vehículo', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 200, child: VehiculoPieChart()),
                ],
              ),
            ),
    );
  }
}

class PavimentoChart extends StatelessWidget {
  const PavimentoChart({super.key});

  @override
  Widget build(BuildContext context) {
    final historial = Provider.of<HistorialController>(context);
    final resultados = historial.resultados;

    final conteo = <String, int>{};
    for (var r in resultados) {
      conteo[r.tipoPavimento] = (conteo[r.tipoPavimento] ?? 0) + 1;
    }

    final List<BarChartGroupData> barData = [];
    int i = 0;
    conteo.forEach((tipo, cantidad) {
      barData.add(
        BarChartGroupData(x: i, barRods: [
          BarChartRodData(
            toY: cantidad.toDouble(),
            color: Colors.deepPurple,
            width: 20,
            borderRadius: BorderRadius.circular(6),
          )
        ]),
      );
      i++;
    });

    return BarChart(
      BarChartData(
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, _) {
                final keys = conteo.keys.toList();
                return Text(keys[value.toInt()], style: const TextStyle(fontSize: 10));
              },
            ),
          ),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        barGroups: barData,
      ),
    );
  }
}

class VehiculoPieChart extends StatelessWidget {
  const VehiculoPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    final historial = Provider.of<HistorialController>(context);
    final resultados = historial.resultados;

    final conteo = <String, int>{};
    for (var r in resultados) {
      conteo[r.tipoVehiculo] = (conteo[r.tipoVehiculo] ?? 0) + 1;
    }

    final total = conteo.values.fold(0, (a, b) => a + b);

    return PieChart(
      PieChartData(
        sections: conteo.entries.map((e) {
          final porcentaje = (e.value / total * 100).toStringAsFixed(1);
          return PieChartSectionData(
            value: e.value.toDouble(),
            color: Colors.primaries[conteo.keys.toList().indexOf(e.key) % Colors.primaries.length],
            title: '$porcentaje%',
            radius: 60,
            titleStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
          );
        }).toList(),
        sectionsSpace: 2,
        centerSpaceRadius: 30,
      ),
    );
  }
}
