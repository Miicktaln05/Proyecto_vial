import 'package:flutter/material.dart';

class SituacionActualPage extends StatelessWidget {
  const SituacionActualPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('4. Situación Actual y Necesidades del Proyecto'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: const Text(
          '''
Actualmente, las vialidades que conectan Nezahualcóyotl con la Ciudad de México presentan un estado crítico debido a la sobrecarga vehicular, la falta de mantenimiento y el diseño inadecuado para las condiciones actuales.

Las principales avenidas como Periférico Oriente, Calzada Ignacio Zaragoza y Anillo Periférico han sido rebasadas en su capacidad. Se registran velocidades promedio muy bajas en horas pico, accidentes frecuentes y contaminación ambiental elevada.

Además, el sistema de transporte público en la zona está saturado, lo que obliga a muchas personas a utilizar transporte privado, agravando aún más los problemas de tráfico.

Ante esta situación, se hace evidente la necesidad de una nueva infraestructura vial que permita descongestionar las vías existentes, ofrecer una alternativa rápida y segura de conexión entre Nezahualcóyotl y la capital, y mejorar la calidad del transporte público mediante carriles confinados o multimodales.
          ''',
          style: TextStyle(fontSize: 16, height: 1.5),
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}
