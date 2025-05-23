import 'package:flutter/material.dart';

class PlanesPoliticasPage extends StatelessWidget {
  const PlanesPoliticasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('5. Planes y Políticas Relacionadas'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: const Text(
          '''
Este proyecto se enmarca dentro de varios planes de desarrollo urbano e infraestructura a nivel municipal, estatal y federal. En primer lugar, el Plan Estatal de Desarrollo del Estado de México contempla como eje prioritario la mejora de la movilidad urbana y la conectividad regional.

Asimismo, el Programa de Ordenamiento Territorial de la Zona Metropolitana del Valle de México (ZMVM) identifica la necesidad de nuevas vías que articulen los polos de crecimiento urbano y descongestionen los accesos principales a la capital.

También se alinea con la Agenda 2030 y los Objetivos de Desarrollo Sostenible (ODS), particularmente con el objetivo 11: “Ciudades y comunidades sostenibles”, al buscar mejorar el acceso a sistemas de transporte seguros, accesibles y sostenibles para todos.

El periférico propuesto contribuye además a la política nacional de infraestructura del gobierno federal, que promueve la inversión pública en proyectos estratégicos para detonar el crecimiento económico y social en zonas con alto rezago.

De igual forma, se ha considerado la normatividad vigente en materia ambiental, urbana y vial para garantizar que el diseño, construcción y operación del proyecto se realicen conforme a los estándares técnicos y legales correspondientes.
          ''',
          style: TextStyle(fontSize: 16, height: 1.5),
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}
