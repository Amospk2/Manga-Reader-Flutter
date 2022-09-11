

import 'package:readermanga/models/manga_model.dart';

abstract class MangaRepository{
  Future<List<MangaModel>> getMangas();
}