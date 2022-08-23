import 'package:flutter/material.dart';
import 'package:star_wars_app/src/pages/avatar/widgets/avatar_body.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AvatarBody(),
    );
  }
}
