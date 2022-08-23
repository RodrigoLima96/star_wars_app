import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  final bool isFavorite;
  final Function function;

  const FavoriteButton({
    Key? key,
    required this.isFavorite,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        size: 50,
        color: isFavorite ? Colors.redAccent : Colors.black,
      ),
    );
  }
}
