import 'package:flutter/material.dart';
import '../models/resultado_columna.dart';
import 'resultado_columna_page.dart';
import 'procedimiento_columna_page.dart';

class CalculoColumnasPage extends StatefulWidget {
  const CalculoColumnasPage({super.key});

  @override
  State<CalculoColumnasPage> createState() => _CalculoColumnasPageState();
}

class _CalculoColumnasPageState extends State<CalculoColumnasPage> {
  final TextEditingController cargaAxialController = TextEditingController();
  final TextEditingController fyController = TextEditingController();
  final TextEditingController areaAceroController = TextEditingController();

  ResultadoColumna? resultado;

  void calcularColumna() {
    final carga = double.tryParse(cargaAxialController.text);
    final fy = double.tryParse(fyController.text);
    final area = double.tryParse(areaAceroController.text);

    if (carga == null || fy == null || area == null || fy == 0 || area == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Ingrese todos los datos válidos')),
      );
      return;
    }

    final resistencia = area * fy;
    final factorSeguridad = resistencia / carga;

    setState(() {
      resultado = ResultadoColumna(
  carga: carga,
  fy: fy,
  area: area,
  resistencia: resistencia,
  factorSeguridad: factorSeguridad,
  columnas: 1, // o el valor que quieras permitir al usuario
  acero: area, // si area es el área de acero requerida
);
    });
  }

  @override
  void dispose() {
    cargaAxialController.dispose();
    fyController.dispose();
    areaAceroController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cálculo de Columnas'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text(
              'Ingrese los datos estructurales:',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: cargaAxialController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Carga axial (kN)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: fyController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Fy del acero (MPa)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: areaAceroController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Área del acero (cm²)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: calcularColumna,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
              ),
              child: const Text('CALCULAR'),
            ),
            const SizedBox(height: 24),
            if (resultado != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '✅ Resistencia: ${resultado!.resistencia.toStringAsFixed(2)} kN',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
                  ),
                  Text(
                    '🔐 Factor de seguridad: ${resultado!.factorSeguridad.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ResultadoColumnaPage(resultado: resultado!),
                        ),
                      );
                    },
                    child: const Text('RESULTADO FINAL'),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ProcedimientoColumnaPage(
                            resultado: resultado!,
                            carga: resultado!.carga,
                            columnas: resultado!.columnas,
                          ),
                        ),
                      );
                    },
                    child: const Text('PROCEDIMIENTO'),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}