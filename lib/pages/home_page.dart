import 'package:flutter/material.dart';
import 'package:readermanga/controllers/manga_controller.dart';
import 'package:readermanga/models/manga_model.dart';
import 'package:readermanga/pages/categories_page.dart';
import '../repository/manga_repository_imp.dart';
import '../utils/build_container_tile_home_page.dart';
import '../utils/page_route_builder.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MangaController _controller = MangaController(MangaRepositoryImp());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 181, 255, 209),
        appBar: AppBar(title: const Text("RManga")),
        drawer: Drawer(
          backgroundColor: const Color.fromARGB(255, 181, 255, 209),
          width: MediaQuery.of(context).size.width * 0.75,
          child: ListView(
            children: [
              DrawerHeader(
                padding: const EdgeInsets.all(0),
                child: Image.asset(
                  'assets/images/animes-online.jpg',
                  fit: BoxFit.fitWidth,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, top: 5, bottom: 10),
                child: const Text(
                  "RManga",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
              SizedBox(
                child: ListTile(
                  leading: const Icon(Icons.book),
                  title: const Text('Categorias'),
                  onTap: () {
                    Navigator.push(context, pageRouteBuilder(const CategoriesPage()));
                  },
                ),
              ),
              SizedBox(
                child: ListTile(
                  leading: const Icon(Icons.new_releases_outlined),
                  title: const Text('Lançamentos'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextField(
                                  onChanged: _controller.onChanged,
                                  decoration: const InputDecoration(
                                      icon: Icon(Icons.search))),
                              const SizedBox(
                                height: 10,
                              ),
                              ValueListenableBuilder<List<MangaModel>>(
                                valueListenable: _controller.mangas,
                                builder: (_, mangas, __) => mangas.isNotEmpty
                                    ? GridView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                mainAxisExtent: 250,
                                                crossAxisSpacing: 10,
                                                mainAxisSpacing: 10),
                                        itemCount: mangas.length,
                                        itemBuilder: (_, idx) =>
                                            buildContainerTile(
                                                mangas[idx], context),
                                      )
                                    : const CircularProgressIndicator(),
                              ),
                            ]),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ));
  }
}




