import 'package:flutter/material.dart';
import 'package:starwars/widgets/star_wars.dart';
import 'package:starwars/widgets/think_it.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          StarWars(),
          ThinkIt(),
        ],
      ),
    );
  }
}
