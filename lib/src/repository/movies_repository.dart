import 'package:star_wars_app/src/models/movie.dart';
import 'package:star_wars_app/src/services/movies_service.dart';

class MoviesRepository {
  final MoviesService _moviesService;

  MoviesRepository(
    this._moviesService,
  );

  Future<List<Movie>> getAllMovies() async {
    final List<Movie> movies = [];

    final List<dynamic> moviesList = await _moviesService.getMoviesList();

    for (var movie in moviesList) {
      movies.add(Movie.fromMap(movie));
    }

    return movies;
  }
}
