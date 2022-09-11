import 'package:flutter/material.dart';
import 'package:readermanga/models/manga_model.dart';

import '../utils/build_tile_view_page.dart';

class ViewPage extends StatefulWidget {
  final MangaModel mangaModel;

  const ViewPage({super.key, required this.mangaModel});

  @override
  State<ViewPage> createState() => _ViewPageState();
}
class _ViewPageState extends State<ViewPage> 
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 47, 53, 47),
      appBar: AppBar(
        title: Text(widget.mangaModel.nome),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 47, 53, 47),
      ),
      body: Stack(children: [
        SizedBox(
          height: 250,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            widget.mangaModel.asset,
            fit: BoxFit.fitWidth,
            alignment: Alignment.center,
          ),
        ),
        Container(
          height: 250,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                const Color.fromARGB(255, 47, 53, 47).withOpacity(1),
                const Color.fromARGB(255, 24, 46, 31).withOpacity(0)
              ])),
        ),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          child: Column(mainAxisSize: MainAxisSize.max, children: [
            Stack(children: [
              Container(
                  height: 250,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                        const Color(0xff11181E).withOpacity(0.5),
                        const Color(0xff11181E).withOpacity(0.4),
                        const Color(0xff404040).withOpacity(0.4)
                      ]))),
            ]),
            Container(
                padding: const EdgeInsets.only(bottom: 20),
                color: const Color(0xff404040),
                width: MediaQuery.of(context).size.width,
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Descrição",
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: RichText(
                                    text: TextSpan(
                                        style: const TextStyle(fontSize: 15),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: widget.mangaModel.description,
                                              style: const TextStyle(
                                                  color: Color(0xffc0c0c0),
                                                  fontFamily: 'Poppins')),
                                          const TextSpan(
                                              text: 'See more',
                                              style: TextStyle(
                                                  color: Color(0xff5093C1),
                                                  fontFamily: 'Poppins'))
                                        ]),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                const Text(
                                  "Capitulos:",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                SizedBox(
                                    height: 300,
                                    child: ListView.builder(
                                        itemCount: widget.mangaModel.totalChapters,
                                        itemBuilder: (__, idx) => buildTile(
                                            idx, widget.mangaModel, context))),
                              ]))
                    ]))
          ]),
        )
      ]),
    );
  }
}
