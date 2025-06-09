import 'package:flutter/material.dart';
import '../models/resultado_zapata.dart';
import 'resultado_zapata_page.dart';
import 'procedimiento_zapata_page.dart';

class CalculoZapatasPage extends StatefulWidget {
  const CalculoZapatasPage({super.key});

  @override
  State<CalculoZapatasPage> createState() => _CalculoZapatasPageState();
}

class _CalculoZapatasPageState extends State<CalculoZapatasPage> {
  final TextEditingController cargaController = TextEditingController();
  final TextEditingController resistenciaController = TextEditingController();
  final TextEditingController factorController = TextEditingController();

  ResultadoZapata? resultado;

  void calcularZapatas() {
    final carga = double.tryParse(cargaController.text);
    final resistencia = double.tryParse(resistenciaController.text);
    final factor = double.tryParse(factorController.text);

    if (carga == null || resistencia == null || factor == null || resistencia == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, ingrese valores válidos')),
      );
      return;
    }

    final area = (carga * factor) / resistencia;

    setState(() {
      resultado = ResultadoZapata(
        carga: carga,
        resistencia: resistencia,
        factor: factor,
        area: area,
      );
    });
  }

  @override
  void dispose() {
    cargaController.dispose();
    resistenciaController.dispose();
    factorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cálculo de Zapatas'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text(
              'Ingrese los datos para calcular el área de la zapata:',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: cargaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Carga total (kN)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: resistenciaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Resistencia del suelo (kN/m²)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: factorController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Factor de seguridad',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: calcularZapatas,
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
                    '🔍 Área recomendada: ${resultado!.area.toStringAsFixed(2)} m²',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (resultado != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ResultadoZapataPage(resultado: resultado!),
                          ),
                        );
                      }
                    },
                    child: const Text('RESULTADO FINAL'),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      if (resultado != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ProcedimientoZapataPage(
                              resultado: resultado!,
                              carga: resultado!.carga,
                            ),
                          ),
                        );
                      }
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