import 'package:flutter/material.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPage();
}

class _CategoriesPage extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Categorias")),
        body: Stack(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                      const SizedBox(height: 15,),
                      ListTile(
                        trailing: const Icon(Icons.arrow_forward),
                        title: const Text("Shounen"),
                        onTap: (){},
                      ),
                      ListTile(
                        trailing: const Icon(Icons.arrow_forward),
                        title: const Text("Drama"),
                        onTap: (){},
                      ),
                      ListTile(
                        trailing: const Icon(Icons.arrow_forward),
                        title: const Text("Romance"),
                        onTap: (){},
                      ),
                      ListTile(
                        trailing: const Icon(Icons.arrow_forward),
                        title: const Text("Seinen"),
                        onTap: (){},
                      ),
                      ListTile(
                        trailing: const Icon(Icons.arrow_forward),
                        title: const Text("Thriller"),
                        onTap: (){},
                      ),
                    
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
