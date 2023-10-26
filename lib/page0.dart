import 'package:articles/page1.dart';
import 'package:articles/page2.dart';
import 'package:articles/page3.dart';
import 'package:flutter/material.dart';

class Page0 extends StatefulWidget {
  const Page0({super.key});

  @override
  State<Page0> createState() => _Page0State();
}

class _Page0State extends State<Page0> {
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
                  builder: (context) => const Page1())
            );
          }, child: const Text("Cliquez ici pour rejoindre la page 1")),
          ElevatedButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const Page2())
            );
          }, child: const Text("Cliquez ici pour rejoindre la page 2")),
          ElevatedButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const Page3())
            );
          }, child: const Text("Cliquez ici pour rejoindre la page 3"))
        ],
      ),
    );
  }
}