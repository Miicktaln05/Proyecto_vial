import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MENÚ'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const Text(
              'SELECCIONE UN APARTADO',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/introduccion');
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
              child: const Text(
                'INTRODUCCIÓN',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/antecedentes');
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
              child: const Text(
                'ANTECEDENTES',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
  onPressed: () {
    Navigator.pushNamed(context, '/planos');
  },
  style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
  child: const Text(
    'PLANOS',
    style: TextStyle(color: Colors.white),
  ),
),
            const SizedBox(height: 12),
          ElevatedButton(
  onPressed: () {
    Navigator.pushNamed(context, '/perth');
  },
  style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
  child: const Text(
    'PERTH',
    style: TextStyle(color: Colors.white),
  ),
),

            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                // Pendiente implementar
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
              child: const Text(
                'COSTOS',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                // Pendiente implementar
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
              child: const Text(
                'CÁLCULOS',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/portada');
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
