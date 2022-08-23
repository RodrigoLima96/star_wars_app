import 'package:flutter/material.dart';
import 'package:star_wars_app/src/pages/favorites/widgets/favorites_body.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: FavoritesBody(),
    );
  }
}
