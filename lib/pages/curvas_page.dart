import 'package:flutter/material.dart';
import 'resultado_curva_page.dart';
import 'procedimiento_curva_page.dart';

class CurvasPage extends StatefulWidget {
  const CurvasPage({super.key});

  @override
  State<CurvasPage> createState() => _CurvasPageState();
}

class _CurvasPageState extends State<CurvasPage> {
  final TextEditingController velocidadController = TextEditingController();
  final TextEditingController peralteController = TextEditingController();
  final TextEditingController friccionController = TextEditingController();

  double? resultadoRadio;

  double? v;
  double? g;
  double? e;
  double? f;

  void calcularCurva() {
    final velocidad = double.tryParse(velocidadController.text);
    final peralte = double.tryParse(peralteController.text);
    final friccion = double.tryParse(friccionController.text);

    if (velocidad == null || peralte == null || friccion == null || (peralte + friccion) == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, ingrese valores válidos')),
      );
      return;
    }

    v = velocidad * 1000 / 3600; // km/h a m/s
    g = 9.81;
    e = peralte;
    f = friccion;

    setState(() {
      resultadoRadio = (v! * v!) / (g! * (e! + f!));
    });
  }

  @override
  void dispose() {
    velocidadController.dispose();
    peralteController.dispose();
    friccionController.dispose();
    super.dispose();
  }

  void verProcedimiento() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ProcedimientoCurvasPage(
          velocidad: v!,
          peralte: e!,
          friccion: f!,
        ),
      ),
    );
  }

  void verResultado() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ResultadoCurvasPage(
          radio: resultadoRadio!,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cálculo de Curvas'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text(
              'Ingrese los datos para calcular el radio mínimo de curva:',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: velocidadController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Velocidad (km/h)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: peralteController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Peralte (ej. 0.07)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: friccionController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Coef. de fricción (ej. 0.15)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: calcularCurva,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
              ),
              child: const Text('CALCULAR'),
            ),
            const SizedBox(height: 24),
            if (resultadoRadio != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '🔍 Radio mínimo recomendado: ${resultadoRadio!.toStringAsFixed(2)} m',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: verProcedimiento,
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    child: const Text('Ver procedimiento'),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: verResultado,
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                    child: const Text('Ver resultado final'),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}