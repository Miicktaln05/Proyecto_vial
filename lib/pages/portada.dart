import 'package:flutter/material.dart';
import '../widgets/menu_drawer.dart';

class PortadaPage extends StatefulWidget {
  const PortadaPage({super.key});

  @override
  State<PortadaPage> createState() => _PortadaPageState();
}

class _PortadaPageState extends State<PortadaPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const MenuDrawer(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('PORTADA'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => scaffoldKey.currentState?.openDrawer(),
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.menu),
      ),
    );
  }
}