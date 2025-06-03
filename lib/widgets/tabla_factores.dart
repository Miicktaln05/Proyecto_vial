// 📄 lib/widgets/tabla_factores.dart
import 'package:flutter/material.dart';

class TablaFactores extends StatelessWidget {
  const TablaFactores({super.key});

  final List<Map<String, String>> datos = const [
    {
      'tipo': 'Eje sencillo (1 llanta por lado)',
      'flexible': '0.41',
      'rigido': '0.33',
    },
    {
      'tipo': 'Eje sencillo (doble llanta)',
      'flexible': '1.00',
      'rigido': '0.85',
    },
    {
      'tipo': 'Eje tándem',
      'flexible': '1.50',
      'rigido': '1.20',
    },
    {
      'tipo': 'Eje tridem',
      'flexible': '2.00',
      'rigido': '1.50',
    },
    {
      'tipo': 'Eje cuádruple',
      'flexible': '2.50',
      'rigido': '2.00',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tabla de Factores SCT'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Factores de Ejes Equivalentes según SCT (valores de referencia)',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Table(
            border: TableBorder.all(color: Colors.grey.shade400),
            columnWidths: const {
              0: FlexColumnWidth(2),
              1: FlexColumnWidth(1),
              2: FlexColumnWidth(1),
            },
            children: [
              TableRow(
                decoration: const BoxDecoration(color: Colors.deepPurple),
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Tipo de eje',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Pav. Flexible',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Pav. Rígido',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
              ...datos.map((fila) => TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(fila['tipo']!),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(fila['flexible']!),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(fila['rigido']!),
                      ),
                    ],
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
