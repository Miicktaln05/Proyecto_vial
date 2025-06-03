// 📄 lib/controllers/tipo_camino_controller.dart
import 'package:flutter/material.dart';

class TipoCaminoController with ChangeNotifier {
  String? _tipoCamino;

  String? get tipoCamino => _tipoCamino;

  void setTipoCamino(String nuevoTipo) {
    _tipoCamino = nuevoTipo;
    notifyListeners(); // notifica a los listeners cuando cambie
  }
}
