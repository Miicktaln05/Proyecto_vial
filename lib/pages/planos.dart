import 'package:flutter/material.dart';

class PlanosPage extends StatelessWidget {
  const PlanosPage({super.key});

  final List<String> actividades = const [
    'Anteproyecto',
    'Proyecto',
    'Trámites administrativos',
    'Levantamiento topográfico',
    'Cartel de identificación de obra',
    'Movilización y desmovilización de equipos',
    'Mantenimiento de tránsito y seguridad vial durante la ejecución',
    'Flete terrestre',
    'Fresado de pavimento y desecho del material',
    'Excavación a 2m con mototeaílla',
    'Relleno con material propio o de banco al nivel del cuerpo del terraplén',
    'Compactación del cuerpo del terraplén al 90%',
    'Relleno con material propio o de banco al nivel del cuerpo de la subyacente',
    'Compactación del cuerpo de la subyacente al 95%',
    'Relleno con material propio o de banco al nivel del cuerpo de la subrasante',
    'Compactación del cuerpo de la subrasante al 100%',
    'Colocación de la sub-base con materiales granulares',
    'Colocación de la base con materiales granulares',
    'Colocación de asfalto tipo carretera',
    'Excavación de zanjas para alcantarillado con zanjadora',
    'Nivelación y compactación del fondo de la zanja con bailarina',
    'Colocación del alcantarillado pluvial',
    'Relleno y compactación de la zanja con bailarina',
    'Cimbrado para banquetas',
    'Armado para banquetas',
    'Colado de concreto para banqueta y aliviadero',
    'Desimbrado de banqueta',
    'Excavación de cunetas con zanjadora pequeña',
    'Nivelación y compactación manual del fondo',
    'Relleno de plantilla con material propio',
    'Cimbrado para cunetas',
    'Colado para cuneta manual',
    'Desimbrado de cunetas',
    'Cimbrado para columnas',
    'Armado de acero corrugado en forma circular'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Planos del Proyecto'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: actividades.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            elevation: 3,
            child: ExpansionTile(
              title: Text(
                'Actividad ${index + 1}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    actividades[index],
                    style: const TextStyle(fontSize: 16, height: 1.4),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
