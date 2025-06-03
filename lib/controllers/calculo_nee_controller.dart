// 📄 lib/controllers/calculo_nee_controller.dart
import 'dart:math' as math;
import '../controllers/vehiculo_provider.dart';

class ResultadoNEE {
  final double feTotalAutobuses;
  final double feTotalCarga;
  final double feGlobal;
  final double factorTotal;
  final double nee;

  ResultadoNEE({
    required this.feTotalAutobuses,
    required this.feTotalCarga,
    required this.feGlobal,
    required this.factorTotal,
    required this.nee,
  });
}

class CalculoNEEController {
  static ResultadoNEE calcular({
    required String tipoCamino,
    required double tpda,
    required double porcentajeLigeros,
    required double porcentajeAutobuses,
    required double porcentajeCarga,
    required List<Vehiculo> vehiculos,
  }) {
    double feTotalAutobuses = 0;
    double feTotalCarga = 0;

    for (final v in vehiculos) {
      final peso = v.pesos[tipoCamino];
      if (peso is! num) continue;

      final fe = _calcularFE(v.ejes, peso.toDouble());
      final porcentaje = v.porcentaje;

      if (_esAutobus(v.nombre)) {
        feTotalAutobuses += (fe * porcentaje);
      } else if (_esCarga(v.nombre)) {
        feTotalCarga += (fe * porcentaje);
      }
    }

    final feGlobal = feTotalAutobuses + feTotalCarga;
    final factorTotal = feGlobal / 100;
    final porcentajeVehiculos = (porcentajeAutobuses + porcentajeCarga) / 100;
    final nee = tpda * porcentajeVehiculos * factorTotal * 365 * 20;

    return ResultadoNEE(
      feTotalAutobuses: feTotalAutobuses,
      feTotalCarga: feTotalCarga,
      feGlobal: feGlobal,
      factorTotal: factorTotal,
      nee: nee,
    );
  }

  static double _calcularFE(int ejes, double pesoToneladas) {
    const pesoEstandar = 8.165; // toneladas
    const n = 4.2;
    final cargaPorEje = pesoToneladas / ejes;
    final fe = cargaPorEje / pesoEstandar;
    return math.pow(fe, n).toDouble();
  }

  static bool _esAutobus(String nombre) {
    return nombre == 'B2' || nombre == 'B3' || nombre == 'B4';
  }

  static bool _esCarga(String nombre) {
    return nombre.startsWith('C') || nombre.startsWith('T');
  }
}
