import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:star_wars_app/src/controllers/movies_page_controller.dart';
import 'package:star_wars_app/src/models/movie.dart';
import 'package:star_wars_app/src/shared/app_list_tile.dart';

class MoviesBody extends StatefulWidget {
  const MoviesBody({Key? key}) : super(key: key);

  @override
  State<MoviesBody> createState() => _MoviesBodyState();
}

class _MoviesBodyState extends State<MoviesBody> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<MoviesPageController>().getMoviesList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<MoviesPageController>();

    return controller.state == MoviesPageState.loading
        ? const Center(child: CircularProgressIndicator())
        : SingleChildScrollView(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.movies.length,
              itemBuilder: (context, index) {
                final List<Movie> movies = controller.movies;

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
