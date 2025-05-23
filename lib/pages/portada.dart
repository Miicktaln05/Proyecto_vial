import 'package:flutter/material.dart';

class PortadaPage extends StatelessWidget {
  const PortadaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('PORTADA'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: const Alignment(0, -0.7),
              child: Text(
                'ESCUELA SUPERIOR DE INGENIERÍA Y ARQUITECTURA\nUNIDAD ZACATENCO',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            Align(
              alignment: const Alignment(0, 0.1),
              child: Text(
                'TÍTULO:\nPERIFÉRICO\n\nREALIZÓ:\n\nMENDOZA SERRALDE JOSÉ GABRIEL\nARROYO RODRÍGUEZ IRAIS CITLALLI\n\nPROFESOR:\nCASTRO MÉNDEZ JAVIER BALDEMAR\n\nGRUPO:\n7CM03',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14),
              ),
            ),
            Align(
              alignment: const Alignment(-0.9, -0.95),
              child: Image.asset(
                'assets/images/ipn-logo.png',
                width: 100,
              ),
            ),
            Align(
              alignment: const Alignment(0.9, -0.95),
              child: Image.asset(
                'assets/images/logoez.png',
                width: 100,
              ),
            ),
            Align(
              alignment: const Alignment(0, 0.9),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/menu');
                },
                child: const Text(
                  'HAGA CLIC PARA CONTINUAR',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
