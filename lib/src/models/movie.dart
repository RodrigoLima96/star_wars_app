class Movie {
  final String title;
  final String id;
  bool? isFavorite;

  Movie({required this.title, required this.id, this.isFavorite}) {
    isFavorite = isFavorite ?? false;
  }

  factory Movie.fromMap(Map<String, dynamic> map, bool favorite) {
    return Movie(
      title: map['title'] ?? '',
      id: map['episode_id'].toString(),
      isFavorite: favorite,
    );
  }
}
