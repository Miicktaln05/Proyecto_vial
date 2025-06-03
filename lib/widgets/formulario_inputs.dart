import 'package:flutter/material.dart';
import '../controllers/calculos_controller.dart';
import 'resultados_card.dart';
import '../utils/exportar_pdf.dart';
import '../models/resultado_model.dart';
import 'package:provider/provider.dart';
import '../controllers/historial_controller.dart';



class FormularioInputs extends StatefulWidget {
  const FormularioInputs({super.key});

  @override
  State<FormularioInputs> createState() => _FormularioInputsState();
}

class _FormularioInputsState extends State<FormularioInputs> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController ejesController = TextEditingController();
  final TextEditingController pesoController = TextEditingController();
  final TextEditingController viajesController = TextEditingController();

  String? tipoVehiculo;
  String? tipoPavimento;

  final List<String> vehiculos = ['Camión rígido', 'Tractocamión', 'Autobús'];
  final List<String> pavimentos = ['Flexible', 'Rígido'];

  double? resultado;

  @override
  void dispose() {
    ejesController.dispose();
    pesoController.dispose();
    viajesController.dispose();
    super.dispose();
  }

  Future<void> calcular() async {
    if (_formKey.currentState!.validate()) {
      final ejes = int.tryParse(ejesController.text) ?? 0;
      final peso = double.tryParse(pesoController.text) ?? 0;
      final viajes = int.tryParse(viajesController.text) ?? 0;
      final pavimento = tipoPavimento ?? 'Flexible';

      final res = CalculosController.calcularEjesEquivalentes(
  numeroEjes: ejes,
  pesoPorEje: peso,
  viajes: viajes,
  tipoPavimento: pavimento,
);

final nuevo = ResultadoModel(
  tipoVehiculo: tipoVehiculo ?? 'N/A',
  tipoPavimento: pavimento,
  ejes: ejes,
  peso: peso,
  viajes: viajes,
  resultado: res,
  fecha: DateTime.now(),
);

final historial = Provider.of<HistorialController>(context, listen: false);
await historial.agregarResultado(nuevo);

setState(() {
  resultado = res;
});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          const Text(
            'Ingrese los datos del vehículo',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 16),

          DropdownButtonFormField<String>(
            decoration: const InputDecoration(labelText: 'Tipo de Vehículo'),
            items: vehiculos
                .map((v) => DropdownMenuItem(value: v, child: Text(v)))
                .toList(),
            onChanged: (v) => setState(() => tipoVehiculo = v),
            validator: (v) => v == null ? 'Seleccione un tipo' : null,
          ),

          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(labelText: 'Tipo de Pavimento'),
            items: pavimentos
                .map((v) => DropdownMenuItem(value: v, child: Text(v)))
                .toList(),
            onChanged: (v) => setState(() => tipoPavimento = v),
            validator: (v) => v == null ? 'Seleccione un tipo' : null,
          ),

          const SizedBox(height: 12),
          TextFormField(
            controller: ejesController,
            decoration: const InputDecoration(labelText: 'Número de ejes'),
            keyboardType: TextInputType.number,
            validator: (v) =>
                (v == null || v.isEmpty) ? 'Ingrese un número' : null,
          ),

          const SizedBox(height: 12),
          TextFormField(
            controller: pesoController,
            decoration: const InputDecoration(labelText: 'Peso por eje (kg)'),
            keyboardType: TextInputType.number,
            validator: (v) =>
                (v == null || v.isEmpty) ? 'Ingrese el peso' : null,
          ),

          const SizedBox(height: 12),
          TextFormField(
            controller: viajesController,
            decoration: const InputDecoration(labelText: 'Número de viajes'),
            keyboardType: TextInputType.number,
            validator: (v) =>
                (v == null || v.isEmpty) ? 'Ingrese la cantidad' : null,
          ),

          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: calcular,
            style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
            child: const Text('CALCULAR'),
          ),

          const SizedBox(height: 24),

          if (resultado != null) ...[
            ResultadosCard(
              resultado: resultado!,
              tipoVehiculo: tipoVehiculo ?? 'N/A',
              tipoPavimento: tipoPavimento ?? 'N/A',
              ejes: int.tryParse(ejesController.text) ?? 0,
              peso: double.tryParse(pesoController.text) ?? 0,
              viajes: int.tryParse(viajesController.text) ?? 0,
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () {
                ExportadorPDF.generarPDF(
                  tipoVehiculo: tipoVehiculo ?? 'N/A',
                  tipoPavimento: tipoPavimento ?? 'N/A',
                  ejes: int.tryParse(ejesController.text) ?? 0,
                  peso: double.tryParse(pesoController.text) ?? 0,
                  viajes: int.tryParse(viajesController.text) ?? 0,
                  resultado: resultado!,
                );
              },
              icon: const Icon(Icons.picture_as_pdf),
              label: const Text('Exportar a PDF'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
