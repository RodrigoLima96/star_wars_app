import 'dart:convert';
import 'package:http/http.dart' as http;

class MoviesService {
  Future<dynamic> getMoviesList() async {
    String uri = 'https://swapi.dev/api/films/';
    final response = await http.get(Uri.parse(uri));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final List<dynamic> moviesList = json['results'];
      return moviesList;
    }
  }
}
