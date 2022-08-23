import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserAvatarButton extends StatelessWidget {
  final int selectedPage;
  final int pageIndex;
  final Function press;

  const UserAvatarButton({
    Key? key,
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
      child: CircleAvatar(
        backgroundColor: selectedPage == pageIndex
            ? const Color.fromARGB(255, 213, 232, 112)
            : Colors.transparent,
        radius: 30,
        child: SvgPicture.asset(
          'assets/icons/user.svg',
          width: 40,
        ),
      ),
    );
  }
}
