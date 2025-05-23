// 📄 lib/pages/antecedentes.dart
import 'package:flutter/material.dart';

class AntecedentesPage extends StatelessWidget {
  const AntecedentesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ANTECEDENTES'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const Text(
              'SELECCIONE EL ANTECEDENTE QUE DESEE',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
  onPressed: () {
    Navigator.pushNamed(context, '/introduccion-antecedentes');
  },
  style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
  child: const Text(
    'INTRODUCCIÓN A ANTECEDENTES',
    style: TextStyle(color: Colors.white),
  ),
),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/contexto-general');
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
              child: const Text(
                '1. Contexto General del Proyecto',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/justificacion');
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
              child: const Text(
                '2. Justificación del Proyecto',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/estudios-preliminares');
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
              child: const Text(
                '3. Estudios Preliminares y Análisis',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/situacion-actual');
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
              child: const Text(
                '4. Situación Actual y Necesidades del Proyecto',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/planes-politicas');
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
              child: const Text(
                '5. Planes y Políticas Relacionadas',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/antecedentes-tecnicos');
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
              child: const Text(
                '6. Antecedentes Técnicos y de Investigación',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
  onPressed: () {
    Navigator.pushNamed(context, '/propuesta-lugar');
  },
  style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
  child: const Text(
    '7. Propuesta de Lugar (Imágenes)',
    style: TextStyle(color: Colors.white),
  ),
),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/menu');
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
              child: const Text(
                'ATRÁS',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
