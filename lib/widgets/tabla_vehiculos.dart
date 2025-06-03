// 📄 lib/widgets/tabla_vehiculos.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/vehiculo_provider.dart';

class TablaVehiculos extends StatefulWidget {
  const TablaVehiculos({super.key});

  @override
  State<TablaVehiculos> createState() => _TablaVehiculosState();
}

class _TablaVehiculosState extends State<TablaVehiculos> {
  final Map<String, TextEditingController> porcentajeControllers = {};

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<VehiculoProvider>(context, listen: false);

    // Aseguramos que los datos estén inicializados desde aquí
    if (provider.vehiculos.isEmpty) {
      provider.inicializarVehiculos(); // <- esto inicializa los vehículos
    }

    for (var vehiculo in provider.vehiculos) {
      porcentajeControllers[vehiculo.nombre] = TextEditingController(
        text: vehiculo.porcentaje == 0 ? '' : vehiculo.porcentaje.toString(),
      );
    }
  }

  @override
  void dispose() {
    for (final c in porcentajeControllers.values) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<VehiculoProvider>(context);
    final tipoCamino = provider.tipoCamino ?? 'Camino tipo A';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tabla de Vehículos'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: provider.vehiculos.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: provider.vehiculos.length,
              itemBuilder: (context, index) {
                final v = provider.vehiculos[index];
                final peso = v.pesos[tipoCamino];
                final controller = porcentajeControllers[v.nombre]!;

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Vehículo: ${v.nombre}', style: const TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        Text('Ejes: ${v.ejes}'),
                        Text('Llantas: ${v.llantas}'),
                        Text(peso is num ? 'Peso: ${peso.toStringAsFixed(1)} toneladas' : 'Peso: N/A'),
                        const SizedBox(height: 12),
                        TextField(
                          controller: controller,
                          decoration: const InputDecoration(
                            labelText: 'Porcentaje de participación (%)',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            final parsed = double.tryParse(value) ?? 0;
                            provider.actualizarPorcentaje(v.nombre, parsed);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
