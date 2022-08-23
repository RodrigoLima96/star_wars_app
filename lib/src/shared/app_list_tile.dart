import 'package:flutter/material.dart';
import 'package:star_wars_app/src/shared/widgets/favorite_button.dart';

class AppListTile extends StatelessWidget {
  final String text;
  final bool isFavorite;
  final Function function;

  const AppListTile({
    Key? key,
    required this.text,
    required this.isFavorite,
    required this.function,
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
          color: Colors.black,
          width: 2,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            FavoriteButton(
              isFavorite: isFavorite,
              function: function,
            ),
          ],
        ),
      ),
    );
  }
}
