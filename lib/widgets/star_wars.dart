import 'package:flutter/material.dart';

class StarWars extends StatelessWidget {
  const StarWars({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Image.asset('assets/images/star_wars_logo_PNG34 1.png'),
      ),
    );
  }
}
