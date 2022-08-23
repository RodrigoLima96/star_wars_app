import 'package:flutter/cupertino.dart';
import 'package:star_wars_app/src/models/character.dart';
import 'package:star_wars_app/src/repository/movies_repository.dart';

enum CharactersPageState { idle, loading, success, error }

class CharactersPageController extends ChangeNotifier {
  final MoviesRepository _moviesRepository;
  List<Character> characters = [];
  var state = CharactersPageState.idle;

  CharactersPageController(
    this._moviesRepository,
  );

  getCharactersList() async {
    state = CharactersPageState.loading;
    notifyListeners();
    try {
      characters = await _moviesRepository.getAllCharacters();
      state = CharactersPageState.success;
      notifyListeners();
    } catch (error) {
      debugPrint(error.toString());
      state = CharactersPageState.error;
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
      await _moviesRepository.insertOrDeleteFavorite(false, id, name);

      characters[index].isFavorite = !characters[index].isFavorite!;
      notifyListeners();
    } catch (error) {
      debugPrint(error.toString());
    }
  }
}
