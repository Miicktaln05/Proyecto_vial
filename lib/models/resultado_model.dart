class ResultadoModel {
  final String tipoVehiculo;
  final String tipoPavimento;
  final int ejes;
  final double peso;
  final int viajes;
  final double resultado;
  final DateTime fecha;

  ResultadoModel({
    required this.tipoVehiculo,
    required this.tipoPavimento,
    required this.ejes,
    required this.peso,
    required this.viajes,
    required this.resultado,
    required this.fecha,
  });

  Map<String, dynamic> toJson() => {
        'tipoVehiculo': tipoVehiculo,
        'tipoPavimento': tipoPavimento,
        'ejes': ejes,
        'peso': peso,
        'viajes': viajes,
        'resultado': resultado,
        'fecha': fecha.toIso8601String(),
      };

  factory ResultadoModel.fromJson(Map<String, dynamic> json) {
    return ResultadoModel(
      tipoVehiculo: json['tipoVehiculo'],
      tipoPavimento: json['tipoPavimento'],
      ejes: json['ejes'],
      peso: (json['peso'] as num).toDouble(),
      viajes: json['viajes'],
      resultado: (json['resultado'] as num).toDouble(),
      fecha: DateTime.parse(json['fecha']),
    );
  }
}
