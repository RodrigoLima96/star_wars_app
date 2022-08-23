import 'package:flutter/material.dart';
import 'package:star_wars_app/src/pages/website/widgets/website_body.dart';

class WebsitePage extends StatelessWidget {
  const WebsitePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WebsiteBody(),
    );
  }
}
