
import 'package:flutter/material.dart';
import 'package:readermanga/utils/page_route_builder.dart';
import '../models/manga_model.dart';
import '../pages/view_chapter_page.dart';

buildTile(var index, MangaModel listChapter, context) {
  for (int i = 0; i < listChapter.downloadChapters.length; i++) {
    if (index == listChapter.downloadChapters[i].chapterNumber - 1) {
      return ListTile(
        title: Text(
          "Capitulo ${(index + 1).toString()}",
          style: const TextStyle(color: Colors.white),
        ),
        trailing: const Icon(
          Icons.arrow_forward,
          color: Colors.white,
        ),
        onTap: () => Navigator.push(
            context,
            pageRouteBuilder(
               ViewChapterPage(
                      chapters: listChapter.downloadChapters[i].content,
                      chapterTitle: listChapter
                          .downloadChapters[i].chapterNumber
                          .toString(),
                    )
            ))
      );
    }
  }

  return ListTile(
    title: Text(
      "Capitulo ${(index + 1).toString()}",
      style: const TextStyle(color: Colors.white),
    ),
    trailing: const Icon(
      Icons.download,
      color: Colors.white,
    ),
    onTap: () {},
  );
}
