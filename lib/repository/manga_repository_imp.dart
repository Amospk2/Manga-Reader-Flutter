

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:readermanga/models/manga_model.dart';
import 'package:readermanga/repository/manga_repository.dart';

class MangaRepositoryImp extends MangaRepository{


  MangaRepositoryImp();

  @override
  Future<List<MangaModel>> getMangas() async {
    
    var response = await rootBundle.loadString('assets/mockup.json');
    List data = jsonDecode(response);
    return data.map((e) => MangaModel.fromMap(e)).toList();

  }

}