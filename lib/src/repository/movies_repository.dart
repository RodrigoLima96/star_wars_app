import 'package:star_wars_app/src/models/character.dart';
import 'package:star_wars_app/src/models/movie.dart';
import 'package:star_wars_app/src/services/favorite_service.dart';
import 'package:star_wars_app/src/services/movies_service.dart';

class MoviesRepository {
  final MoviesService _moviesService;
  final FavoriteService _favoriteService;

  MoviesRepository(
    this._moviesService,
    this._favoriteService,
  );

  Future<List<Movie>> getAllMovies() async {
    final List<Movie> movies = [];

    var db = await _favoriteService.database;

    List favoriteList =
        await db.query('favorites', where: 'type = ?', whereArgs: ['movie']);

    final List<dynamic> moviesList = await _moviesService.getMoviesList();

    for (var movie in moviesList) {
      bool fav = false;
      if (favoriteList.any((favorite) =>
          favorite['id'].contains(movie['episode_id'].toString()))) {
        fav = true;
      }

      movies.add(Movie.fromMap(movie, fav));
    }
    return movies;
  }

  Future<List<Character>> getAllCharacters() async {
    final List<Character> characters = [];

    var db = await _favoriteService.database;

    List favoriteList = await db
        .query('favorites', where: 'type = ?', whereArgs: ['character']);

    final List<dynamic> charactersList =
        await _moviesService.getCharactersList();

    for (var character in charactersList) {
      bool fav = false;
      if (favoriteList.any((favorite) =>
          favorite['id'].contains(character['name'].toString()))) {
        fav = true;
      }

      characters.add(Character.fromMap(character, fav));
    }

    return characters;
  }

  Future<void> insertOrDeleteFavorite(
      bool isMovie, String id, String name) async {
    var db = await _favoriteService.database;

    List favoriteList =
        await db.query('favorites', where: 'id = ?', whereArgs: [id]);

    bool isNew = favoriteList.isEmpty;

    if (isNew) {
      db.insert('favorites', {
        'id': id,
        'type': isMovie ? 'movie' : 'character',
        'name': isMovie ? name : id,
      });
    } else {
      db.delete('favorites', where: 'id = ?', whereArgs: [id]);
    }
  }
}
