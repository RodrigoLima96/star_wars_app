import 'package:flutter/cupertino.dart';
import 'package:star_wars_app/src/models/favorite.dart';
import 'package:star_wars_app/src/repository/movies_repository.dart';

enum FavoritePageState { idle, loading, success, error }

class FavoritePageController extends ChangeNotifier {
  List<Favorite> favorites = [];
  final MoviesRepository _moviesRepository;
  var state = FavoritePageState.idle;

  FavoritePageController(
    this._moviesRepository,
  );

  getFavoriteList() async {
    state = FavoritePageState.loading;
    notifyListeners();
    try {
      favorites = await _moviesRepository.getFavorites();
      state = FavoritePageState.success;
      notifyListeners();
    } catch (error) {
      state = FavoritePageState.loading;
      notifyListeners();
    }
    notifyListeners();
  }
}
