import 'package:flutter/material.dart';

class CaminosPage extends StatelessWidget {
  const CaminosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CAMINOS'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, '/curvas'),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
          child: const Text('Calculadora de curvas'),
        ),
      ),
    );
  }
}