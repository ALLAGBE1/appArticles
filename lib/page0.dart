import 'package:articles/page1.dart';
import 'package:articles/page2.dart';
import 'package:flutter/material.dart';

class Home0 extends StatefulWidget {
  const Home0({super.key});

  @override
  State<Home0> createState() => _Home0State();
}

class _Home0State extends State<Home0> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const Home1())
            );
          }, child: const Text("Cliquez ici pour rejoindre la page 1")),
          ElevatedButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const Page2())
            );
          }, child: const Text("Cliquez ici pour rejoindre la page 2")),
        ],
      ),
    );
  }
}