// 📄 lib/controllers/vehiculo_provider.dart
import 'package:flutter/material.dart';

class Vehiculo {
  final String nombre;
  final int ejes;
  final int llantas;
  final Map<String, dynamic> pesos;
  double porcentaje;

  Vehiculo({
    required this.nombre,
    required this.ejes,
    required this.llantas,
    required this.pesos,
    this.porcentaje = 0.0,
  });
}

class VehiculoProvider with ChangeNotifier {
  String? _tipoCamino;
  double _tpda = 0;
  double _ligeros = 0;
  double _autobuses = 0;
  double _carga = 0;

  final List<Vehiculo> _vehiculos = [];

  // SETTERS
  void setTipoCamino(String tipo) {
    _tipoCamino = tipo;
    notifyListeners();
  }

  void setTPDA(double value) {
    _tpda = value;
    notifyListeners();
  }

  void setLigeros(double value) {
    _ligeros = value;
    notifyListeners();
  }

  void setAutobuses(double value) {
    _autobuses = value;
    notifyListeners();
  }

  void setCarga(double value) {
    _carga = value;
    notifyListeners();
  }

  void actualizarPorcentaje(String nombre, double porcentaje) {
    final index = _vehiculos.indexWhere((v) => v.nombre == nombre);
    if (index != -1) {
      _vehiculos[index].porcentaje = porcentaje;
      notifyListeners();
    }
  }

  double getPorcentaje(String nombre) {
    final vehiculo = _vehiculos.firstWhere(
      (v) => v.nombre == nombre,
      orElse: () => Vehiculo(nombre: nombre, ejes: 0, llantas: 0, pesos: {}),
    );
    return vehiculo.porcentaje;
  }

  // Inicializar solo una vez
  void inicializarVehiculos() {
    if (_vehiculos.isNotEmpty) return;

    final datos = _vehiculosRaw;

    for (var v in datos) {
      _vehiculos.add(Vehiculo(
        nombre: v['nombre'],
        ejes: v['ejes'],
        llantas: v['llantas'],
        pesos: Map<String, dynamic>.from(v['peso']),
      ));
    }
    notifyListeners();
  }

  // GETTERS
  String? get tipoCamino => _tipoCamino;
  double get tpda => _tpda;
  double get ligeros => _ligeros;
  double get autobuses => _autobuses;
  double get carga => _carga;
  List<Vehiculo> get vehiculos => _vehiculos;

  // 💾 Datos crudos directamente aquí
  final List<Map<String, dynamic>> _vehiculosRaw = [
    {
      'nombre': 'B2',
      'ejes': 2,
      'llantas': 6,
      'peso': {
        'Camino tipo A': 19,
        'Camino tipo B': 16.5,
        'Camino tipo C': 14.5,
        'Camino tipo D': 13,
      },
    },
    {
      'nombre': 'B3',
      'ejes': 3,
      'llantas': 10,
      'peso': {
        'Camino tipo A': 27.5,
        'Camino tipo B': 23,
        'Camino tipo C': 20,
        'Camino tipo D': 18.5,
      },
    },
    {
      'nombre': 'B4',
      'ejes': 4,
      'llantas': 10,
      'peso': {
        'Camino tipo A': 30.5,
        'Camino tipo B': 25,
        'Camino tipo C': 22.5,
        'Camino tipo D': 21,
      },
    },
    {
      'nombre': 'C2',
      'ejes': 2,
      'llantas': 6,
      'peso': {
        'Camino tipo A': 19,
        'Camino tipo B': 16.5,
        'Camino tipo C': 14.5,
        'Camino tipo D': 13,
      },
    },
    {
      'nombre': 'C2 R2',
      'ejes': 4,
      'llantas': 14,
      'peso': {
        'Camino tipo A': 37.5,
        'Camino tipo B': 35.5,
        'Camino tipo C': 'N/A',
        'Camino tipo D': 'N/A',
      },
    },
    {
      'nombre': 'C2 R3',
      'ejes': 5,
      'llantas': 10,
      'peso': {
        'Camino tipo A': 44.5,
        'Camino tipo B': 41,
        'Camino tipo C': 'N/A',
        'Camino tipo D': 'N/A',
      },
    },
    {
      'nombre': 'C3',
      'ejes': 3,
      'llantas': 10,
      'peso': {
        'Camino tipo A': 27.5,
        'Camino tipo B': 23,
        'Camino tipo C': 17,
        'Camino tipo D': 18.5,
      },
    },
    {
      'nombre': 'C3 R2',
      'ejes': 5,
      'llantas': 18,
      'peso': {
        'Camino tipo A': 44.5,
        'Camino tipo B': 42,
        'Camino tipo C': 'N/A',
        'Camino tipo D': 'N/A',
      },
    },
    {
      'nombre': 'C3 R3',
      'ejes': 6,
      'llantas': 22,
      'peso': {
        'Camino tipo A': 51.5,
        'Camino tipo B': 47.5,
        'Camino tipo C': 'N/A',
        'Camino tipo D': 'N/A',
      },
    },
    {
      'nombre': 'T2 S1',
      'ejes': 3,
      'llantas': 10,
      'peso': {
        'Camino tipo A': 30,
        'Camino tipo B': 26,
        'Camino tipo C': 22.5,
        'Camino tipo D': 'N/A',
      },
    },
    {
      'nombre': 'T2 S1 R2',
      'ejes': 5,
      'llantas': 18,
      'peso': {
        'Camino tipo A': 47.5,
        'Camino tipo B': 'N/A',
        'Camino tipo C': 'N/A',
        'Camino tipo D': 'N/A',
      },
    },
    {
      'nombre': 'T2 S1 R3',
      'ejes': 6,
      'llantas': 22,
      'peso': {
        'Camino tipo A': 54.5,
        'Camino tipo B': 'N/A',
        'Camino tipo C': 'N/A',
        'Camino tipo D': 'N/A',
      },
    },
    {
      'nombre': 'T2 S2',
      'ejes': 4,
      'llantas': 14,
      'peso': {
        'Camino tipo A': 38,
        'Camino tipo B': 31.5,
        'Camino tipo C': 28,
        'Camino tipo D': 'N/A',
      },
    },
    {
      'nombre': 'T2 S1 R2',
      'ejes': 6,
      'llantas': 22,
      'peso': {
        'Camino tipo A': 54.5,
        'Camino tipo B': 'N/A',
        'Camino tipo C': 'N/A',
        'Camino tipo D': 'N/A',
      },
    },
    {
      'nombre': 'T2 S3',
      'ejes': 5,
      'llantas': 18,
      'peso': {
        'Camino tipo A': 45.5,
        'Camino tipo B': 39,
        'Camino tipo C': 34.5,
        'Camino tipo D': 'N/A',
      },
    },
    {
      'nombre': 'T3 S1',
      'ejes': 4,
      'llantas': 14,
      'peso': {
        'Camino tipo A': 38.5,
        'Camino tipo B': 32.5,
        'Camino tipo C': 28,
        'Camino tipo D': 'N/A',
      },
    },
    {
      'nombre': 'T3 S1 R2',
      'ejes': 6,
      'llantas': 22,
      'peso': {
        'Camino tipo A': 54.5,
        'Camino tipo B': 'N/A',
        'Camino tipo C': 'N/A',
        'Camino tipo D': 'N/A',
      },
    },
    {
      'nombre': 'T3 S1 R3',
      'ejes': 7,
      'llantas': 26,
      'peso': {
        'Camino tipo A': 61.5,
        'Camino tipo B': 'N/A',
        'Camino tipo C': 'N/A',
        'Camino tipo D': 'N/A',
      },
    },
    {
      'nombre': 'T3 S2',
      'ejes': 5,
      'llantas': 18,
      'peso': {
        'Camino tipo A': 46.5,
        'Camino tipo B': 38,
        'Camino tipo C': 33.5,
        'Camino tipo D': 'N/A',
      },
    },
    {
      'nombre': 'T3 S2 R2',
      'ejes': 7,
      'llantas': 26,
      'peso': {
        'Camino tipo A': 61.5,
        'Camino tipo B': 'N/A',
        'Camino tipo C': 'N/A',
        'Camino tipo D': 'N/A',
      },
    },
    {
      'nombre': 'T3 S2 R3',
      'ejes': 8,
      'llantas': 30,
      'peso': {
        'Camino tipo A': 69.5,
        'Camino tipo B': 'N/A',
        'Camino tipo C': 'N/A',
        'Camino tipo D': 'N/A',
      },
    },
    {
      'nombre': 'T3 S2 R4',
      'ejes': 9,
      'llantas': 34,
      'peso': {
        'Camino tipo A': 75.5,
        'Camino tipo B': 'N/A',
        'Camino tipo C': 'N/A',
        'Camino tipo D': 'N/A',
      },
    },
    {
      'nombre': 'T3 S2 S2',
      'ejes': 6,
      'llantas': 22,
      'peso': {
        'Camino tipo A': 63.5,
        'Camino tipo B': 'N/A',
        'Camino tipo C': 'N/A',
        'Camino tipo D': 'N/A',
      },
    },
    {
      'nombre': 'T3 S3',
      'ejes': 6,
      'llantas': 22,
      'peso': {
        'Camino tipo A': 54,
        'Camino tipo B': 45.5,
        'Camino tipo C': 40,
        'Camino tipo D': 'N/A',
      },
    },
    {
      'nombre': 'T3 S3 S2',
      'ejes': 8,
      'llantas': 30,
      'peso': {
        'Camino tipo A': 69.5,
        'Camino tipo B': 'N/A',
        'Camino tipo C': 'N/A',
        'Camino tipo D': 'N/A',
      },
    },
  ];
}
