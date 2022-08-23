import 'package:flutter/material.dart';

class FavoriteTile extends StatelessWidget {
  final String text;
  final bool isMovie;

  const FavoriteTile({
    Key? key,
    required this.text,
    required this.isMovie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.1,
      width: size.width,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      decoration: BoxDecoration(
        border: Border.all(
          color: isMovie
              ? const Color.fromARGB(255, 255, 54, 54)
              : const Color.fromARGB(255, 128, 255, 0),
          width: 2,
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
