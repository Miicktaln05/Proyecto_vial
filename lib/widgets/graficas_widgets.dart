import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class GraficaComparativa extends StatelessWidget {
  const GraficaComparativa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gráfica Comparativa'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BarChart(
          BarChartData(
            alignment: BarChartAlignment.spaceAround,
            maxY: 100,
            barTouchData: BarTouchData(enabled: true),
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, _) {
                    switch (value.toInt()) {
                      case 0:
                        return const Text('Flexible');
                      case 1:
                        return const Text('Rígido');
                      default:
                        return const Text('');
                    }
                  },
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: true),
              ),
            ),
            barGroups: [
              BarChartGroupData(x: 0, barRods: [
                BarChartRodData(toY: 65, color: Colors.blue),
              ]),
              BarChartGroupData(x: 1, barRods: [
                BarChartRodData(toY: 80, color: Colors.green),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
