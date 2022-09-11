import 'package:flutter/material.dart';
import 'package:readermanga/utils/page_route_builder.dart';

import '../models/manga_model.dart';
import '../pages/view_page.dart';

buildContainerTile(MangaModel manga, BuildContext context) {
  return Container(
    decoration: const BoxDecoration(
        color: Color.fromARGB(255, 13, 31, 11),
        borderRadius: BorderRadius.all(Radius.circular(15))),
    height: 220,
    width: 200,
    child: InkWell(
      onTap: () {
        Navigator.push(
            context,
            pageRouteBuilder(ViewPage(
              mangaModel: manga,
            )));
      },
      child: Column(
        children: [
          SizedBox(
            height: 220,
            width: 200,
            child: Image.asset(
              manga.asset,
              fit: BoxFit.fitWidth,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(manga.nome.toString(),
              style: const TextStyle(
                fontSize: 16,
                color: Color.fromARGB(255, 255, 253, 253),
              )),
        ],
      ),
    ),
  );
}
