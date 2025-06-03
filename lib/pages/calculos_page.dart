// 📄 lib/pages/calculos_page.dart
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/vehiculo_provider.dart';
import '../controllers/calculo_nee_controller.dart';
import '../widgets/tabla_vehiculos.dart';

class CalculosPage extends StatefulWidget {
  const CalculosPage({super.key});

  @override
  State<CalculosPage> createState() => _CalculosPageState();
}

class _CalculosPageState extends State<CalculosPage> {
  final TextEditingController tpdaController = TextEditingController();
  final TextEditingController ligerosController = TextEditingController();
  final TextEditingController autobusesController = TextEditingController();
  final TextEditingController cargaController = TextEditingController();

  final List<String> caminos = [
    'Camino tipo A',
    'Camino tipo B',
    'Camino tipo C',
    'Camino tipo D',
  ];

  @override
  void dispose() {
    tpdaController.dispose();
    ligerosController.dispose();
    autobusesController.dispose();
    cargaController.dispose();
    super.dispose();
  }

  void mostrarTablaVehiculos() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const TablaVehiculos()),
    );
  }

  void calcular() {
  final provider = Provider.of<VehiculoProvider>(context, listen: false);
  final tpda = double.tryParse(tpdaController.text);
  final ligeros = double.tryParse(ligerosController.text);
  final autobuses = double.tryParse(autobusesController.text);
  final carga = double.tryParse(cargaController.text);

  if ([tpda, ligeros, autobuses, carga].contains(null) || provider.tipoCamino == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Por favor, rellene todos los campos con números válidos.')),
    );
    return;
  }

  final sumaPorcentajes = (ligeros! + autobuses! + carga!);
  if (sumaPorcentajes != 100) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('La suma de porcentajes debe ser 100%. Actualmente es $sumaPorcentajes%.')),
    );
    return;
  }

  // ✅ Ya están verificados, ahora podemos usarlos con "!"
  provider.setTPDA(tpda!);
  provider.setLigeros(ligeros);
  provider.setAutobuses(autobuses);
  provider.setCarga(carga);

  Navigator.pushNamed(context, '/resultado');
}


  void verProcedimiento() {
    Navigator.pushNamed(context, '/procedimiento');
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<VehiculoProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('CÁLCULOS'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<String>(
              value: provider.tipoCamino,
              decoration: const InputDecoration(labelText: 'Tipo de camino'),
              items: caminos.map((c) {
                return DropdownMenuItem(value: c, child: Text(c));
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  provider.setTipoCamino(value);
                }
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: tpdaController,
              decoration: const InputDecoration(labelText: 'TPDA'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: ligerosController,
              decoration: const InputDecoration(labelText: '% de vehículos ligeros'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: autobusesController,
              decoration: const InputDecoration(labelText: '% de autobuses'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: cargaController,
              decoration: const InputDecoration(labelText: '% de vehículos de carga'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: mostrarTablaVehiculos,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
              ),
              child: const Text('Selección de vehículos y porcentajes (%)'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: calcular,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
              ),
              child: const Text('CALCULAR'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: verProcedimiento,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
              ),
              child: const Text('PROCEDIMIENTO'),
            ),
          ],
        ),
      ),
    );
  }
}
