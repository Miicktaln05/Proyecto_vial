class ResultadoColumna {
  final double carga;
  final double fy;
  final double area;
  final double resistencia;
  final double factorSeguridad;
  final int columnas;
  final double acero;

  ResultadoColumna({
    required this.carga,
    required this.fy,
    required this.area,
    required this.resistencia,
    required this.factorSeguridad,
    required this.columnas,
    required this.acero,
  });
}