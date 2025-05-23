import 'package:flutter/material.dart';

class AntecedentesTecnicosPage extends StatelessWidget {
  const AntecedentesTecnicosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('6. Antecedentes Técnicos y de Investigación'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: const Text(
          '''
Previo a la formulación de este proyecto, se han realizado diversos estudios técnicos y de investigación que sustentan su viabilidad.

Entre ellos se encuentran estudios de tráfico, geotecnia, topografía, análisis de impacto ambiental y evaluaciones sociales. Estas investigaciones han sido realizadas por instituciones académicas, despachos de ingeniería, gobiernos locales y organismos federales.

Los estudios de tráfico muestran patrones de movilidad consistentes con la necesidad de una vía alternativa. Los análisis geotécnicos confirman que el tipo de suelo es adecuado para soportar una obra de esta magnitud, y los estudios ambientales identifican riesgos mitigables con tecnología adecuada.

También se ha investigado sobre experiencias similares en otras zonas metropolitanas del país, como el segundo piso del Periférico en CDMX, el Macrolibramiento de Guadalajara y el Periférico Ecológico de Puebla, con el fin de identificar buenas prácticas y evitar errores comunes.

Finalmente, se han consultado bases de datos y estadísticas del INEGI, SEMOVI, SCT, entre otros, para garantizar que los datos utilizados en la planeación sean actualizados y representativos.
          ''',
          style: TextStyle(fontSize: 16, height: 1.5),
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}
