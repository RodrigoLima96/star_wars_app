import 'package:flutter/material.dart';

class TabButton extends StatelessWidget {
  final String text;
  final int selectedPage;
  final int pageIndex;
  final Function press;

  const TabButton({
    Key? key,
    required this.text,
    required this.selectedPage,
    required this.pageIndex,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        press();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 20,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: selectedPage == pageIndex
              ? const Color.fromARGB(255, 213, 232, 112)
              : Colors.transparent,
          border: Border.all(
            color: selectedPage == pageIndex
                ? const Color.fromARGB(255, 164, 200, 144)
                : Colors.black,
            width: 2,
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
