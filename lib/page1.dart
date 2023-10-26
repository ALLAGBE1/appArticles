// ignore_for_file: avoid_print

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


class MenuItem {
  final IconData icon;
  final String label;

  MenuItem(this.icon, this.label);
}

List<MenuItem> menuItems = [
  MenuItem(Icons.man, "Manga"),
  MenuItem(Icons.woman_2_rounded, "Comics"),
  MenuItem(Icons.movie, "Cinéma"),
  MenuItem(Icons.woman, "Manga 2"),
];

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: const BackButton(color: Colors.blue,),
        title: const Text("Retour", style: TextStyle(color: Colors.blue),)
      ),
      body: SingleChildScrollView(
        dragStartBehavior: DragStartBehavior.down,
        child: Column(
          children: [
            _titlePage(),
            _menu(),
            _cadre1(),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.02,),
            Container(child: _textSousCardre()),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.01,),
            Container(child: _listCard()),
          ],
        ),
      ),
    );
  }

  Widget _titlePage() {
    return Container(
      width: 330,
      alignment: Alignment.bottomLeft,
      child: const Text(
        "NOS ARTICLES",
        textAlign: TextAlign.start, 
        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _menu() {
    const double itemSpacing = 8.0;
    return SizedBox(
      height: MediaQuery.of(context).size.height / 8,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          MenuItem menuItem = menuItems[index];
          return Padding(
            padding: const EdgeInsets.only(right: itemSpacing),
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: const Color.fromARGB(255, 240, 237, 237)),
                child: InkWell(
                  onTap: (){
                    print("Appuyer");
                  },
                  child: Row(
                    children: [
                      Icon(menuItem.icon),
                      const SizedBox(width: 10),
                      Text(menuItem.label),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _cadre1() {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: MyClipper(),
          child: Container(
            height: 170,
            width: 330,
            decoration: const BoxDecoration(color: Color.fromARGB(255, 209, 207, 207)),
          ),
        ),
        const Positioned(
          top: 0,
          left: 0,
          child: Text(
            'Dernière articles',
            style: TextStyle(fontSize: 16, color: Colors.blue),
          ),
        ),
      ],
    );
  }

  Widget _textSousCardre() {
    return const SizedBox(
      width: 330,
      child: Center(
        child: Text(
          "DCU REBOOT : POURQUOI FAUT IL FAIRE CONFIANCE (OU NON) À JAMES GUNN",
          textAlign: TextAlign.justify,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19, letterSpacing: 1),
        ),
      ),
    );
  }

  Widget _listCard() {
    return SizedBox(
      width: 330,
      // height: 500, 
      height: MediaQuery.of(context).size.height * 0.5, 
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Column(
            children: [
              const Divider(height: 48,),
              InkWell(
                onTap: () {
                  print("Appuyer");
                },
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width * 0.350,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color.fromARGB(255, 209, 207, 207),
                        ),
                        child: const Center(child: Text(" ")),
                      ),
                    ),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "ONE PUNCH MAN, UN MANGA SIMPLISTE?",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Row(
                            children: [
                              Text("Review", style: TextStyle(color: Colors.blue)),
                              Text(" • "),
                              Text("20 août 2022", style: TextStyle(color: Colors.black)),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    // Ajout de la ligne horizontale avant la fente
    double lineY = 30.0; // Position de la ligne horizontale 
    path.moveTo(0, lineY); // Déplacement à la position de départ de la ligne
    path.lineTo(size.width, lineY); // Dessine la ligne horizontale

    // Ajout du reste du chemin
    path.lineTo(0, 150); // Coin supérieur gauche de la fente
    path.lineTo(150, 0); // Coin supérieur gauche de la fente
    path.lineTo(size.width, 0); // Coin supérieur droit
    path.lineTo(size.width, size.height); // Coin inférieur droit
    path.lineTo(0, size.height); // Coin inférieur gauche
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

