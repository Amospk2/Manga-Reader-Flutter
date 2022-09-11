import 'package:flutter/foundation.dart';
import 'package:readermanga/models/manga_model.dart';
import 'package:readermanga/repository/manga_repository_imp.dart';

class MangaController {
  final MangaRepositoryImp mangaRepositoryImp;

  MangaController(this.mangaRepositoryImp) {
    fetch();
  }

  ValueNotifier<List<MangaModel>> mangas = ValueNotifier<List<MangaModel>>([]);
  List<MangaModel>? _cacheMangas;

  fetch() async {
    mangas.value = await mangaRepositoryImp.getMangas();
    _cacheMangas = mangas.value;
  }

  onChanged(String value) {
    mangas.value = _cacheMangas!
        .where((e) =>
            e.nome.toString().toLowerCase().contains(value.toLowerCase()))
        .toList();
  }
}
