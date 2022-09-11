import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ViewChapterPage extends StatefulWidget {
  final List<dynamic> chapters;
  final String chapterTitle;

  const ViewChapterPage(
      {super.key, required this.chapters, required this.chapterTitle});

  @override
  State<ViewChapterPage> createState() => _ViewChapterPageState();
}

class _ViewChapterPageState extends State<ViewChapterPage> {
  ValueNotifier<int> pageActual = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Capitulo ${widget.chapterTitle}"),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 47, 53, 47),
        ),
        body: Column(
          children: [
            ValueListenableBuilder<int>(
              valueListenable: pageActual,
              builder: (_, page, __) => SizedBox(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.82,
                      child: PhotoView(
                          imageProvider: AssetImage(widget.chapters[page]),
                          maxScale: 2.5,
                          minScale: 0.38),
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: (() {
                              pageActual.value == 0
                                  ? pageActual.value =
                                      widget.chapters.length - 1
                                  : pageActual.value -= 1;
                            }),
                            icon: const Icon(Icons.arrow_back)),
                        const Spacer(),
                        Text("Pagina $page"),
                        const Spacer(),
                        IconButton(
                            onPressed: (() {
                              pageActual.value == (widget.chapters.length - 1)
                                  ? pageActual.value = 0
                                  : pageActual.value += 1;
                            }),
                            icon: const Icon(Icons.arrow_forward))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
