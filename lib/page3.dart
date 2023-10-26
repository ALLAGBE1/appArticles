import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: const BackButton(color: Colors.blue,),
        title: const Text("Retour", style: TextStyle(color: Colors.blue),),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 2),
            child: IconButton(onPressed: (){}, icon: const Icon(Icons.edit)),
          )
        ],
      ),
      body: SingleChildScrollView(
        dragStartBehavior: DragStartBehavior.down,
        child: Column(
          children: [
            _cadre1(),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.02,),
            Container(child: _textSousCardre()),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.02,),
            Container(child: _textDuSousCardre(),),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.04,),
            Container(child: _textSousCardre2(),),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.02,),
            Container(child: _textDuSousCardre(),),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.03,),
            _cadre2(),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.03,),
            Container(child: _textDuSousCardre(),),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.03,),

          ],
        ),
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
            width: MediaQuery.sizeOf(context).width,
            decoration: const BoxDecoration(color: Color.fromARGB(255, 209, 207, 207)),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            padding: const EdgeInsets.only(left: 18),
            child: const Text(
              'Manga / Review',
              style: TextStyle(fontSize: 16, color: Colors.blue),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.only(left: 18),
            child: Container(
              padding: const EdgeInsets.only(right: 7, bottom: 5),
              child: const Text(
                "20 août 2022",
                style: TextStyle(fontSize: 12, color: Colors.blue),
              ),
            ),
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

  Widget _textDuSousCardre() {
    return const SizedBox(
      width: 330,
      child: Center(
        child: Text("Ces dernières années ont été marquées par une nette amélioration du niveau de l’animation grâce à des studios talentueux comme MAPPA, WIT Studio ou encore UFOTABLE. Pour le plus grand plaisir de chacun, nous voyons ainsi nos mangas préférés sublimés. Et qu’un manga soit qualitatif, avec une histoire originale ou non, une animation d’un excellent niveau est un excellent avantage concurrentiel à mettre en avant. La qualité de l’animation devient à elle seule l’une des raisons qui poussera à regarder une série animée. Mais un nouveau moyen d’attirer l’œil se démarque, il s’agit des openings."),
      ),
    );
  }

  Widget _textSousCardre2() {
    return Container(
      alignment: Alignment.bottomLeft,
      width: 330,
      child: const Text(
        "LE BUT DE L'OPENING",
        textAlign: TextAlign.justify,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19, letterSpacing: 1),
      ),
    );
  }

  Widget _cadre2() {
    return Container(
      height: 170,
      width: MediaQuery.sizeOf(context).width,
      decoration: const BoxDecoration(color: Color.fromARGB(255, 209, 207, 207)),
      child: const Center(child: Text(" ")),
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
    path.lineTo(0, 260); // Coin supérieur gauche de la fente
    path.lineTo(260, 0); // Coin supérieur gauche de la fente
    path.lineTo(size.width, 0); // Coin supérieur droit
    path.lineTo(size.width, size.height - 100); // Coin inférieur droit de la première fente
    path.lineTo(size.width - 100, size.height); // Coin inférieur droit de la première fente
    path.lineTo(0, size.height); // Coin inférieur gauche

    // Ajout de la ligne horizontale avant la fente du bas
    double bottomLineY = size.height - 50; // Position de la ligne horizontale avant la fente du bas
    path.moveTo(0, bottomLineY); // Déplacement à la position de départ de la ligne
    path.lineTo(size.width, bottomLineY); // Dessine la ligne horizontale

    // Ajout de la fente du bas
    path.lineTo(size.width, size.height - 100); // Coin inférieur droit de la fente du bas
    path.lineTo(size.width - 100, size.height); // Coin inférieur droit de la fente du bas
    path.lineTo(0, size.height); // Coin inférieur gauche

    // Ajout de la ligne horizontale après la fente du bas
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
