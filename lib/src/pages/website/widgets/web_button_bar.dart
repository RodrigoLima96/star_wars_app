import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:star_wars_app/src/pages/website/widgets/web_button.dart';

class WebButtonBar extends StatelessWidget {
  const WebButtonBar({
    Key? key,
    required this.webViewController,
  }) : super(key: key);

  final InAppWebViewController? webViewController;

  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: <Widget>[
        WebButton(
          function: () {
            webViewController?.goBack();
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
        WebButton(
          function: () {
            webViewController?.goForward();
          },
          icon: const Icon(
            Icons.arrow_forward,
          ),
        ),
        WebButton(
          function: () {
            webViewController?.reload();
          },
          icon: const Icon(
            Icons.refresh,
          ),
        ),
      ],
    );
  }
}
