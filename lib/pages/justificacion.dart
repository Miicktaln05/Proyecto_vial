import 'package:flutter/material.dart';

class JustificacionPage extends StatelessWidget {
  const JustificacionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('2. Justificación del Proyecto'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: const Text(
          '''
La necesidad de desarrollar un nuevo periférico entre Nezahualcóyotl y la Ciudad de México surge de una problemática de movilidad cada vez más grave. Los habitantes de esta región enfrentan largos tiempos de traslado, saturación de las avenidas existentes, altos niveles de contaminación y deficiencias en el transporte público. Estas condiciones afectan directamente la calidad de vida de la población, limitan las oportunidades laborales, educativas y recreativas, y generan un desgaste físico y emocional importante.

El crecimiento poblacional y vehicular de los últimos años ha superado la capacidad de las vialidades actuales, lo que ha provocado un colapso en el sistema de transporte de la zona. La falta de alternativas eficientes ha llevado a una dependencia excesiva del transporte privado, lo cual contribuye aún más a la congestión vehicular y al deterioro ambiental.

Además, la ubicación estratégica de Nezahualcóyotl como zona de paso entre diferentes puntos del oriente del Valle de México lo convierte en un nodo clave dentro del sistema metropolitano de transporte. Mejorar la conectividad de esta zona permitiría una mayor integración regional, facilitando los flujos de personas y mercancías, y fortaleciendo el desarrollo económico y social tanto del Estado de México como de la Ciudad de México.

Este proyecto de periférico no sólo busca resolver los problemas actuales, sino también anticiparse al crecimiento futuro de la población y del parque vehicular. Por lo tanto, la justificación del proyecto se basa en la urgencia de construir una vía que funcione como una solución estructural y de largo plazo, que brinde beneficios sostenibles en términos de movilidad, medio ambiente, seguridad vial y desarrollo urbano.

La inversión en esta infraestructura es, por lo tanto, una medida estratégica para mejorar la competitividad de la región, reducir las brechas de desigualdad en el acceso al transporte y elevar la calidad de vida de millones de personas que habitan y transitan diariamente por esta zona.
          ''',
          style: TextStyle(fontSize: 16, height: 1.5),
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}
