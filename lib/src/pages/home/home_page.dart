import 'package:flutter/material.dart';
import 'package:star_wars_app/src/pages/home/widgets/home_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: HomeBody());
  }
}
