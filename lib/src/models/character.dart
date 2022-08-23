class Character {
  final String name;
  final String id;
  bool? isFavorite;

  Character({required this.name, required this.id, this.isFavorite}) {
    isFavorite = isFavorite ?? false;
  }

  factory Character.fromMap(Map<String, dynamic> map, bool favorite) {
    return Character(
      name: map['name'] ?? '',
      id: map['name'].toString(),
      isFavorite: favorite,
    );
  }
}
