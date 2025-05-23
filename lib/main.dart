import 'package:flutter/material.dart';
import 'routes.dart';

void main() {
  runApp(const ProyectoVialApp());
}

class ProyectoVialApp extends StatelessWidget {
  const ProyectoVialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Proyecto Periférico Nezahualcóyotl',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: 'Inter',
      ),
      initialRoute: '/portada',
      routes: appRoutes,
    );
  }
}
