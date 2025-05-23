import 'package:flutter/material.dart';

class EstudiosPreliminaresPage extends StatelessWidget {
  const EstudiosPreliminaresPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('3. Estudios Preliminares y Análisis'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: const Text(
          '''
Para fundamentar la necesidad de este proyecto, se realizaron diversos estudios preliminares que permitieron analizar la situación actual y proyectar escenarios futuros.

Uno de los principales análisis realizados fue el estudio de movilidad en la zona oriente del Valle de México. A través de conteos vehiculares, encuestas de origen-destino y mediciones de tiempos de traslado, se determinó que el flujo vehicular entre Nezahualcóyotl y la Ciudad de México es uno de los más altos en toda la metrópoli.

También se llevó a cabo un estudio topográfico y geotécnico de la zona donde se plantea construir el nuevo periférico. Estos estudios permitieron identificar las características del terreno, como tipo de suelo, nivel freático, pendientes, etc., lo cual es esencial para el diseño del trazo y las estructuras que formarán parte del proyecto.

Además, se evaluó la infraestructura vial existente, identificando sus principales deficiencias en términos de capacidad, estado físico, accesibilidad y seguridad. Se realizó un inventario de las vialidades principales y se analizaron sus características funcionales.

Todos estos estudios permitieron generar un diagnóstico preciso de la problemática actual y diseñar una propuesta integral que considere los aspectos técnicos, sociales, ambientales y económicos necesarios para la viabilidad del proyecto.
          ''',
          style: TextStyle(fontSize: 16, height: 1.5),
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}
