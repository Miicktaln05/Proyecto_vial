// 📄 lib/controllers/calculos_controller.dart
import 'dart:math';

class CalculosController {
  /// Factores base por tipo de pavimento (según tablas SCT).
  static final Map<String, double> factoresBase = {
    'Flexible': 1.0,
    'Rígido': 1.2,
  };

  /// Calcula los ejes equivalentes (EE) con la fórmula AASHTO:
  /// EE = (peso / peso estándar)^n
  /// Luego se multiplica por el número de ejes, viajes y factor de pavimento.
  static double calcularEjesEquivalentes({
    required int numeroEjes,
    required double pesoPorEje,
    required int viajes,
    required String tipoPavimento,
  }) {
    final factorBase = factoresBase[tipoPavimento] ?? 1.0;

    const double pesoEstandar = 8165.0; // kg por eje (referencia AASHTO)
    const double exponente = 4.2;       // Exponente recomendado por AASHTO

    final double eePorEje = pow(pesoPorEje / pesoEstandar, exponente) as double;
    final double resultado = numeroEjes * viajes * factorBase * eePorEje;

    return double.parse(resultado.toStringAsFixed(2)); // Redondeado a 2 decimales
  }
}
