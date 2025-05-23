import 'package:flutter/material.dart';

class IntroduccionAntecedentesPage extends StatelessWidget {
  const IntroduccionAntecedentesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Introducción a Antecedentes'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: const Text(
          '''
El desarrollo de infraestructura vial en la zona metropolitana del Valle de México ha sido un tema prioritario debido a los constantes problemas de movilidad y congestionamiento vehicular que afectan a millones de personas. En particular, el municipio de Nezahualcóyotl, ubicado en el Estado de México, ha experimentado un crecimiento poblacional acelerado en las últimas décadas, lo que ha generado una demanda urgente de nuevas vías de comunicación que conecten eficientemente con la Ciudad de México. Este municipio, junto con otras zonas aledañas, ha enfrentado serias dificultades en cuanto a la infraestructura vial, lo que se traduce en altos niveles de tráfico, tiempos de traslado largos y una mala calidad del aire debido a las emisiones de los vehículos.

A lo largo de los años, se han implementado diversas medidas para tratar de aliviar estos problemas de movilidad en la zona, pero los esfuerzos han sido insuficientes para satisfacer las necesidades de la población y el creciente número de vehículos. En este contexto, se ha propuesto el desarrollo de un periférico que conecte de manera más directa y eficiente el municipio de Nezahualcóyotl con la Ciudad de México, en un tramo que abarcaría diversas zonas clave de la región metropolitana. Esta infraestructura busca atender las necesidades actuales y futuras de conectividad entre ambas ciudades, considerando tanto el crecimiento poblacional como el incremento proyectado en el número de vehículos.

El concepto de periféricos viales en la Ciudad de México no es nuevo. Desde hace varias décadas, la capital ha venido desarrollando una serie de autopistas y vías rápidas que rodean la zona urbana para mejorar la movilidad entre diferentes municipios y delegaciones. Un ejemplo de ello es el Periférico de la Ciudad de México, una de las principales arterias viales que conecta diversas zonas de la capital. Sin embargo, la saturación de estas vías y el aumento de la población en áreas circundantes han generado la necesidad de diseñar nuevas rutas que permitan una distribución más eficiente del tráfico, evitando la congestión en los accesos principales de la Ciudad de México.

En este contexto, varios estudios de movilidad y planificación urbana han identificado la construcción de un periférico adicional que conecte Nezahualcóyotl con la Ciudad de México como una prioridad para mejorar el flujo vehicular en la zona oriente de la metrópoli. De hecho, el gobierno estatal y federal han incluido este proyecto en diversos planes de desarrollo urbano y de infraestructura vial como una necesidad urgente para atender la creciente demanda de transporte y reducir los tiempos de desplazamiento de los habitantes del oriente del Valle de México.

Los estudios previos realizados han mostrado que la falta de alternativas viales eficientes en esta zona ha generado graves problemas de tráfico y ha afectado la calidad de vida de los habitantes, quienes, en su mayoría, deben trasladarse diariamente a la Ciudad de México para trabajar, estudiar o realizar otras actividades. Las soluciones propuestas hasta ahora, como la ampliación de algunas avenidas y la mejora del transporte público, no han sido suficientes para resolver los problemas de saturación vial, por lo que se ha considerado que un nuevo periférico sería la respuesta más efectiva para optimizar el sistema de transporte en esta área.

En adición, se han realizado estudios de impacto ambiental y social que identifican los posibles efectos negativos que podría generar la construcción de este periférico, tales como el posible incremento de la contaminación en áreas adyacentes y el desplazamiento de comunidades vulnerables. Sin embargo, se han planteado soluciones para mitigar estos impactos, como la integración de soluciones ecológicas y el diseño de un proyecto que contemple medidas de protección ambiental, así como la reubicación adecuada de las personas afectadas.

Este proyecto no solo forma parte de la política de infraestructura vial del gobierno mexicano, sino que también se encuentra alineado con los objetivos de desarrollo sostenible establecidos por las autoridades locales, buscando crear un entorno más seguro, accesible y eficiente para los habitantes del Estado de México y la Ciudad de México. Así, el periférico Nezahualcóyotl - Ciudad de México se perfila como una de las obras más importantes para la conectividad y desarrollo urbano de la zona metropolitana, no solo como una solución de transporte, sino como un motor para el crecimiento económico y social de la región.

Tomaremos los siguientes puntos en el cual basaremos el proyecto.
          ''',
          style: TextStyle(fontSize: 16, height: 1.5),
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}
