import 'package:flutter/material.dart';
import 'package:proyecto_vial/utils/exportador_planos_pdf.dart';

class PlanosPage extends StatefulWidget {
  const PlanosPage({super.key});

  @override
  State<PlanosPage> createState() => _PlanosPageState();
}

class _PlanosPageState extends State<PlanosPage> {
  final List<Map<String, String>> planos = [
    {
      'nombre': 'plano1.jpg',
      'titulo': 'Plano Topográfico',
      'descripcion':
          '📍 Topografía del terreno del proyecto.\n\nLas curvas de nivel están trazadas cada 1 metro, lo que permite identificar claramente la pendiente y relieve del terreno. También se observa el trazo propuesto para el camino principal del periférico.',
    },
    {
      'nombre': 'plano2.jpg',
      'titulo': 'Losa de Desplante',
      'descripcion':
          '🧱 Diseño de losa de desplante en puente carretero.\n\nIncluye secciones transversales, espesores, armado y anclajes. Este plano es crucial para comprender la transmisión de cargas a la cimentación.',
    },
    {
      'nombre': 'plano3.jpg',
      'titulo': 'Detalle Periférico',
      'descripcion':
          '🛣 Detalle de secciones y dimensiones del camino.\n\nVisualiza anchos de carriles, acotamientos, banquetas y camellones, además de drenaje y señalización.',
    },
  ];

  void _exportarPlano(BuildContext context, String titulo, String descripcion) async {
    final pdfData = await ExportadorPlanosPDF.generarPDF(titulo: titulo, descripcion: descripcion);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('✅ Plano exportado a PDF correctamente (mocked)')),
    );
    // Aquí puedes usar Printing.layoutPdf(...) si lo implementas realmente
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Planos del Proyecto'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Scrollable.ensureVisible(context),
        backgroundColor: Colors.deepPurple,
        icon: const Icon(Icons.navigation),
        label: const Text('Ir al inicio'),
      ),
      body: ListView.builder(
        itemCount: planos.length,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final plano = planos[index];
          final String rutaImagen = 'assets/images/${plano['nombre']}';
          final String descripcion = plano['descripcion']!;
          final String titulo = plano['titulo']!;

          return Card(
            elevation: 6,
            margin: const EdgeInsets.only(bottom: 24),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: rutaImagen,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                    child: Image.asset(
                      rutaImagen,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 220,
                      errorBuilder: (_, __, ___) => const Center(
                        child: Padding(
                          padding: EdgeInsets.all(24),
                          child: Text('❌ Imagen no encontrada'),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    descripcion,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => VistaAmpliadaPage(
                              imagen: rutaImagen,
                              tag: rutaImagen,
                              titulo: titulo,
                            ),
                          ),
                        );
                      },
                      icon: const Icon(Icons.fullscreen, color: Colors.deepPurple),
                      label: const Text('Ampliar', style: TextStyle(color: Colors.deepPurple)),
                    ),
                    TextButton.icon(
                      onPressed: () => _exportarPlano(context, titulo, descripcion),
                      icon: const Icon(Icons.picture_as_pdf, color: Colors.deepPurple),
                      label: const Text('Exportar', style: TextStyle(color: Colors.deepPurple)),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class VistaAmpliadaPage extends StatelessWidget {
  final String imagen;
  final String tag;
  final String titulo;

  const VistaAmpliadaPage({
    super.key,
    required this.imagen,
    required this.tag,
    required this.titulo,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(titulo, style: const TextStyle(fontSize: 14)),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Hero(
          tag: tag,
          child: InteractiveViewer(
            panEnabled: true,
            minScale: 0.5,
            maxScale: 5.0,
            child: Image.asset(imagen),
          ),
        ),
      ),
    );
  }
}