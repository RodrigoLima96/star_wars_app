import 'package:flutter/material.dart';
import 'package:star_wars_app/src/models/movie.dart';
import 'package:star_wars_app/src/shared/app_list_tile.dart';

class MoviesBody extends StatelessWidget {
  const MoviesBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Movie> movies = [
      Movie(title: 'A New Hope', id: '1'),
      Movie(title: 'Return of the Jedi', id: '2'),
    ];

    return SingleChildScrollView(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return AppListTile(
            text: movies[index].title,
            isFavorite: movies[index].isFavorite!,
            function: () {},
          );
        },
      ),
    );
  }
}
