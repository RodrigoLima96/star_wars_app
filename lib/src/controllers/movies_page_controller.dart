import 'package:flutter/material.dart';
import 'package:star_wars_app/src/models/movie.dart';
import 'package:star_wars_app/src/repository/movies_repository.dart';

enum MoviesPageState { idle, loading, success, error }

class MoviesPageController extends ChangeNotifier {
  List<Movie> movies = [];
  final MoviesRepository _moviesRepository;
  var state = MoviesPageState.idle;

  MoviesPageController(
    this._moviesRepository,
  );

  getMoviesList() async {
    state = MoviesPageState.loading;
    notifyListeners();
    try {
      movies = await _moviesRepository.getAllMovies();
      state = MoviesPageState.success;
      notifyListeners();
    } catch (error) {
      debugPrint(error.toString());
      state = MoviesPageState.error;
      notifyListeners();
    }
    notifyListeners();
  }

  insertOrDeleteFavorite({
    required String id,
    required int index,
    required String name,
  }) async {
    try {
      await _moviesRepository.insertOrDeleteFavorite(true, id, name);

      movies[index].isFavorite = !movies[index].isFavorite!;
      notifyListeners();
    } catch (error) {
      debugPrint(error.toString());
    }
  }
}
