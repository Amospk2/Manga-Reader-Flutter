// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:readermanga/models/chapter_model.dart';

class MangaModel {

  MangaModel({
    required this.nome,
    required this.avaliacao,
    required this.genero,
    required this.asset,
    required this.description,
    required this.downloadChapters,
    required this.totalChapters,
  });

  final String nome;
  final int avaliacao;
  final String genero;
  final String asset;
  final String description;
  final List<Chapter> downloadChapters;
  final int totalChapters;



  factory MangaModel.fromMap(Map<String, dynamic> map) {
    return MangaModel(
      nome: map['nome'] as String,
      avaliacao: map['avaliacao'] as int,
      genero: map['genero'] as String,
      asset: map['asset'] as String,
      description: map['description'] as String,
      downloadChapters: List<Chapter>.from((map['downloadChapters'] as List<dynamic>).map<Chapter>((x) => Chapter.fromMap(x as Map<String,dynamic>),),),
      totalChapters: map['totalChapters'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory MangaModel.fromJson(String source) => MangaModel.fromMap(json.decode(source) as Map<String, dynamic>);


  MangaModel copyWith({
    String? nome,
    int? avaliacao,
    String? genero,
    String? asset,
    String? description,
    List<Chapter>? downloadChapters,
    int? totalChapters,
  }) {
    return MangaModel(
      nome: nome ?? this.nome,
      avaliacao: avaliacao ?? this.avaliacao,
      genero: genero ?? this.genero,
      asset: asset ?? this.asset,
      description: description ?? this.description,
      downloadChapters: downloadChapters ?? this.downloadChapters,
      totalChapters: totalChapters ?? this.totalChapters,
    );
  }



  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nome': nome,
      'avaliacao': avaliacao,
      'genero': genero,
      'asset': asset,
      'description': description,
      'downloadChapters': downloadChapters.map((x) => x.toMap()).toList(),
      'totalChapters': totalChapters,
    };
  }

  @override
  String toString() {
    return 'MangaModel(nome: $nome, avaliacao: $avaliacao, genero: $genero, asset: $asset, description: $description, downloadChapters: $downloadChapters, totalChapters: $totalChapters)';
  }

  @override
  bool operator ==(covariant MangaModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.nome == nome &&
      other.avaliacao == avaliacao &&
      other.genero == genero &&
      other.asset == asset &&
      other.description == description &&
      listEquals(other.downloadChapters, downloadChapters) &&
      other.totalChapters == totalChapters;
  }

  @override
  int get hashCode {
    return nome.hashCode ^
      avaliacao.hashCode ^
      genero.hashCode ^
      asset.hashCode ^
      description.hashCode ^
      downloadChapters.hashCode ^
      totalChapters.hashCode;
  }
}
