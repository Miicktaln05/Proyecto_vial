import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/resultado_model.dart';

class HistorialController extends ChangeNotifier {
  List<ResultadoModel> _resultados = [];

  List<ResultadoModel> get resultados => _resultados;

  Future<void> cargarHistorial() async {
    final prefs = await SharedPreferences.getInstance();
    final datos = prefs.getStringList('historial') ?? [];

    _resultados = datos.map((e) => ResultadoModel.fromJson(json.decode(e))).toList();
    notifyListeners();
  }

  Future<void> agregarResultado(ResultadoModel resultado) async {
    final prefs = await SharedPreferences.getInstance();
    _resultados.add(resultado);

    final datos = _resultados.map((e) => json.encode(e.toJson())).toList();
    await prefs.setStringList('historial', datos);

    notifyListeners();
  }

  Future<void> limpiarHistorial() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('historial');
    _resultados.clear();
    notifyListeners();
  }
}
