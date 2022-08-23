import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermoji.dart';

class AvatarBody extends StatelessWidget {
  const AvatarBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ListView(
      physics: const BouncingScrollPhysics(),
      children: <Widget>[
        FluttermojiCircleAvatar(
          backgroundColor: Colors.grey[300],
          radius: 100,
        ),
        const SizedBox(height: 20),
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 30),
                child: FluttermojiCustomizer(
                  scaffoldWidth: min(600, size.width * 0.85),
                  autosave: true,
                  theme: FluttermojiThemeData(
                      boxDecoration:
                          const BoxDecoration(boxShadow: [BoxShadow()])),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
