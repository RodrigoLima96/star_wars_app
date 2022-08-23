class Favorite {
  final String id;
  final String type;
  final String name;

  Favorite({
    required this.id,
    required this.type,
    required this.name,
  });

  factory Favorite.fromMap(Map<String, dynamic> map) {
    return Favorite(
      id: map['id'] ?? '',
      type: map['type'] ?? '',
      name: map['name'] ?? '',
    );
  }
}
