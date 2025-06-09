import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'routes.dart';
import 'controllers/historial_controller.dart';
import 'controllers/vehiculo_provider.dart';

// Importa los modelos y páginas que necesitan argumentos
import 'models/resultado_zapata.dart';
import 'models/resultado_columna.dart';
import 'pages/resultado_zapata_page.dart';
import 'pages/procedimiento_zapata_page.dart';
import 'pages/resultado_columna_page.dart';
import 'pages/procedimiento_columna_page.dart';

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
      },
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/resultado_zapata':
            final resultado = settings.arguments as ResultadoZapata;
            return MaterialPageRoute(
              builder: (_) => ResultadoZapataPage(resultado: resultado),
            );
          case '/procedimiento_zapata':
            final resultado = settings.arguments as ResultadoZapata;
            return MaterialPageRoute(
              builder: (_) => ProcedimientoZapataPage(
                resultado: resultado,
                carga: resultado.carga,
              ),
            );
          case '/resultado_columna':
            final resultado = settings.arguments as ResultadoColumna;
            return MaterialPageRoute(
              builder: (_) => ResultadoColumnaPage(resultado: resultado),
            );
          case '/procedimiento_columna':
            final resultado = settings.arguments as ResultadoColumna;
            return MaterialPageRoute(
              builder: (_) => ProcedimientoColumnaPage(
                resultado: resultado,
                carga: resultado.carga,
                columnas: resultado.columnas,
              ),
            );
          default:
            return null;
        }
      },
    );
  }
}