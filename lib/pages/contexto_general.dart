import 'package:flutter/material.dart';

class ContextoGeneralPage extends StatelessWidget {
  const ContextoGeneralPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('1. Contexto General del Proyecto'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: const Text(
          '''
El municipio de Nezahualcóyotl, ubicado en el Estado de México, es uno de los más densamente poblados en la zona metropolitana del Valle de México. Con una población que supera el millón de habitantes, Nezahualcóyotl ha experimentado un crecimiento acelerado en las últimas décadas, lo que ha generado un incremento significativo en la demanda de servicios básicos, infraestructura vial y transporte.

En particular, la conectividad entre Nezahualcóyotl y la Ciudad de México se ha vuelto un desafío debido a la saturación de las principales vías de acceso, como el Periférico y la Autopista México-Puebla. La carencia de una vía eficiente que una de manera directa estas dos áreas clave ha originado graves problemas de congestión vehicular, tiempos prolongados de traslado y una alta contaminación.

Desde hace varias décadas, la capital ha venido desarrollando una serie de autopistas y vías rápidas que rodean la zona urbana para mejorar la movilidad entre diferentes municipios y delegaciones. Sin embargo, la saturación de estas vías y el aumento de la población en áreas circundantes han generado la necesidad de diseñar nuevas rutas que permitan una distribución más eficiente del tráfico.

En este contexto, varios estudios de movilidad y planificación urbana han identificado la construcción de un periférico adicional que conecte Nezahualcóyotl con la Ciudad de México como una prioridad para mejorar el flujo vehicular en la zona oriente de la metrópoli.
          ''',
          style: TextStyle(fontSize: 16, height: 1.5),
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}
