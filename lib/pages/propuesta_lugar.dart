import 'package:flutter/material.dart';

class PropuestaLugarPage extends StatelessWidget {
  const PropuestaLugarPage({super.key});

  Widget seccionImagen({
    required String texto,
    required String assetName,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            texto,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              height: 1.5,
            ),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: InteractiveViewer(
              panEnabled: true,
              minScale: 1,
              maxScale: 4,
              child: Image.asset(
                'assets/images/$assetName',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text('Propuesta de Lugar'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            seccionImagen(
              texto:
                  'Mapa general de México mostrando la región central donde se ubica el Valle de México.',
              assetName: 'mapa_mexico.jpg',
            ),
            seccionImagen(
              texto:
                  'Coordenadas geográficas aproximadas del área de intervención.',
              assetName: 'coordenadas_mx.jpg',
            ),
            seccionImagen(
              texto:
                  'Localización del Estado de México y su conexión con la CDMX.',
              assetName: 'estado_mex.jpg',
            ),
            seccionImagen(
              texto:
                  'Imagen del municipio de Texcoco y su relevancia dentro del proyecto vial.',
              assetName: 'texcoco.jpg',
            ),
            seccionImagen(
              texto:
                  'Vista de la carretera propuesta, observando su infraestructura actual.',
              assetName: 'carretera.jpg',
            ),
            seccionImagen(
              texto:
                  'Representación topográfica de la zona oriente de la metrópoli.',
              assetName: 'topografia.jpg',
            ),
          ],
        ),
      ),
    );
  }
}
