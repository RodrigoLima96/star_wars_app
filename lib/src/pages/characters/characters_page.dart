import 'package:flutter/material.dart';
import 'package:star_wars_app/src/pages/characters/widgets/characters_body.dart';

class CharactersPage extends StatelessWidget {
  const CharactersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CharactersBody(),
    );
  }
}
