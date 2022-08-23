import 'package:flutter/material.dart';
import 'package:star_wars_app/src/pages/movies/widgets/movies_body.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MoviesBody(),
    );
  }
}
