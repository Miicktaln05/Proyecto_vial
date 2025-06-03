import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'routes.dart';
import 'controllers/historial_controller.dart';
import 'controllers/vehiculo_provider.dart';
// 👇 Paso 3: Importamos la pantalla del menú principal
import 'pages/menu.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HistorialController()),
        ChangeNotifierProvider(create: (_) => VehiculoProvider()),
      ],
      child: const ProyectoVialApp(),
    ),
  );
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
      routes: {
        ...appRoutes,
        '/menu': (context) => const MenuPage(), // 👈 Paso 3: Ruta a nuevo menú
      },
    );
  }
}
