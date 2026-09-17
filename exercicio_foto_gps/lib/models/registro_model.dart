import 'dart:convert';

class RegistroModel {
  final int? id;
  final String dataHora;
  final double latitude;
  final double longitude;
  final String observacao;
  final String caminhoFoto;

  RegistroModel({
    this.id,
    required this.dataHora,
    required this.latitude,
    required this.longitude,
    required this.observacao,
    required this.caminhoFoto,
  });

  // Converte o objeto para Map (usado para inserir no SQLite)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'data_hora': dataHora,
      'latitude': latitude,
      'longitude': longitude,
      'observacao': observacao,
      'caminho_foto': caminhoFoto,
    };
  }

  // Converte um Map do SQLite de volta para objeto RegistroModel
  factory RegistroModel.fromMap(Map<String, dynamic> map) {
    return RegistroModel(
      id: map['id'],
      dataHora: map['data_hora'],
      latitude: map['latitude'],
      longitude: map['longitude'],
      observacao: map['observacao'],
      caminhoFoto: map['caminho_foto'],
    );
  }
}