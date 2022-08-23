import 'package:flutter/material.dart';

class WebButton extends StatelessWidget {
  final Function function;
  final Icon icon;
  const WebButton({
    Key? key,
    required this.function,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: icon,
      onPressed: () {
        function();
      },
    );
  }
}
