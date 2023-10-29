// ignore_for_file: avoid_print, unnecessary_brace_in_string_interps, use_build_context_synchronously

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:tosho/services/wordpress_service.dart';
import 'package:tosho/tosho_colors.dart';
import 'package:wordpress_api/wordpress_api.dart';
import 'package:intl/intl.dart';
import 'package:cached_network_image/cached_network_image.dart';



class MenuItem {
  // final IconData icon;
  final Widget icon;
  final String label;

  MenuItem(this.icon, this.label);
}

List<MenuItem> menuItems = [
  MenuItem(Image.asset("assets/images/manga.png"), "Manga"),
  MenuItem(Image.asset("assets/images/comics.png"), "Comics"),
  MenuItem(Image.asset("assets/images/cinema.png"), "Cinéma"),
];

String formatDate(String dateStr) {
  DateTime date = DateTime.parse(dateStr);
  DateFormat formatter = DateFormat('dd MMMM yyyy', 'fr_FR');
  return formatter.format(date);
}


class Page1 extends StatefulWidget {
  final ToshoColors colors;

  const Page1({Key? key, required this.colors}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  final WordpressService wordpressService = WordpressService();
  int activeIndex = 0;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('fr_FR');
  }

  void _updateActiveIndex(int index) {
    setState(() {
      activeIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: BackButton(color: widget.colors.toshoPurple,),
        title: _widgetDeRetour()
      ),
      body: SingleChildScrollView(
        dragStartBehavior: DragStartBehavior.down,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _widgetTitlePage(widget.colors),
            _widgetMenu(widget.colors),
            _widgetCadre(widget.colors),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.02,),
            Container(child: _widgetTitleSousCadre()),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.01,),
            Container(child: _widgetData(widget.colors)),
          ],
        ),
      ),
    );
  }

  Widget _widgetDeRetour() {
    return  Text(
      "Retour", 
      style: Theme.of(context).textTheme.headlineMedium!.copyWith(
        color: widget.colors.toshoPurple,
        height: 22 / 17,
      )
    );
  }

  Widget _widgetTitlePage(ToshoColors colors) {
    return Container(
      height: 32,
      width: 330,
      alignment: Alignment.bottomLeft,
      child: Text(
        "NOS ARTICLES",
        textAlign: TextAlign.start,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  Widget _widgetMenu(ToshoColors colors) {
    const double itemSpacing = 8.0;
    return SizedBox(
      height: MediaQuery.of(context).size.height / 8,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          MenuItem menuItem = menuItems[index];
          bool isActive = activeIndex == index;
          return Padding(
            padding: const EdgeInsets.only(right: itemSpacing),
            child: Center(
              child: Container(
                width: 122,
                height: 37,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: isActive ? colors.antiFlashWhite : colors.antiFlashWhite),
                child: InkWell(
                  onTap: (){
                    _updateActiveIndex(index);
                    print("<something>");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      menuItem.icon,
                      const SizedBox(width: 10),
                      Text(menuItem.label, textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: isActive ? colors.toshoPurple : colors.oxfordBlue
                      )),
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

  Widget _widgetCadre(ToshoColors colors) {
    Color color = const Color(0xFFD9D9D9);
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: MyClipper(),
          child: Container(
            height: 170,
            width: 330,
            decoration: BoxDecoration(color: color),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Text(
            'Dernière articles',
            style: Theme.of(context).textTheme.labelLarge!.copyWith(color: colors.toshoPurple),
          ),
        ),
      ],
    );
  }

  Widget _widgetTitleSousCadre() {
    return SizedBox(
      width: 330,
      child: Center(
        child: Text(
          "DCU REBOOT : POURQUOI FAUT IL FAIRE CONFIANCE (OU NON) À JAMES GUNN",
          textAlign: TextAlign.justify,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }

  Widget _widgetData(ToshoColors colors) {
    return FutureBuilder<List<Post>>(
      future: wordpressService.getPosts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final List<Post> posts = snapshot.data!;
          // print("Data1111111111111111111111111111, ${posts}");
          return SizedBox(
            width: 330,
            height: MediaQuery.of(context).size.height * 0.5,
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final RegExp regex = RegExp(r'src="([^"]+)"');
                final Match? match = regex.firstMatch("${posts[index].content}");
                final String? imageUrl = match?.group(1);
                return Column(
                  children: [
                    Divider(height: 48, color: colors.cadetGray,),
                    InkWell(
                      onTap: () {
                        print("<something>");
                      },
                      child: Row(
                        children: [
                          _widgetImage(imageUrl),
                          Expanded(
                            child: _widgetInfo(posts, index, colors)
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
      },
    );
  }

  Widget _widgetImage(imageUrl) {
    Color color = const Color(0xFFD9D9D9);
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Container(
        height: 100,
        width: MediaQuery.of(context).size.width * 0.350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: color, 
        ),
        child: CachedNetworkImage(
          imageUrl: imageUrl ?? '',
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          height: 100,
          width: MediaQuery.of(context).size.width * 0.350,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _widgetInfo(posts, index, colors) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${posts[index].title}",
          style: Theme.of(context).textTheme.displaySmall,
        ),
        Row(
          children: [
            Text("Review", 
              style: Theme.of(context).textTheme.labelLarge!.copyWith(color: colors.toshoPurple)),
            const Text(" • "),
            Text(formatDate("${posts[index].date}"), 
              style: Theme.of(context).textTheme.labelLarge!.copyWith(color: colors.cadetGray)),
          ],
        )
      ],
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

