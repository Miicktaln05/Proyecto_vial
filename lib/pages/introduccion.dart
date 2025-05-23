import 'package:flutter/material.dart';

class IntroduccionPage extends StatelessWidget {
  const IntroduccionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('INTRODUCCIÓN'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: const Text(
            '''
El presente trabajo tiene como finalidad el análisis, planeación, evaluación y proyección del Periférico en la zona de Nezahualcóyotl, CDMX.

Este proyecto contempla el estudio de las condiciones del terreno, aspectos normativos, diseño vial y aspectos constructivos, así como el análisis económico para determinar la viabilidad del mismo.

Se pretende aplicar herramientas de ingeniería civil y normativa de la SCT para calcular los ejes equivalentes, evaluar tipos de suelo mediante el sistema PERTH y estimar los costos asociados a la obra.
            ''',
            style: TextStyle(fontSize: 16, height: 1.5),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }
}
