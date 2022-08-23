import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:star_wars_app/src/pages/website/widgets/web_button_bar.dart';

class WebsiteBody extends StatefulWidget {
  const WebsiteBody({Key? key}) : super(key: key);

  @override
  State<WebsiteBody> createState() => _WebsiteBodyState();
}

class _WebsiteBodyState extends State<WebsiteBody> {
  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewController? webViewController;
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
    android: AndroidInAppWebViewOptions(
      useHybridComposition: true,
    ),
  );

  String url = "";
  double progress = 0;
  final urlController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Stack(
            children: [
              InAppWebView(
                key: webViewKey,
                initialUrlRequest: URLRequest(
                    url: Uri.parse("https://www.starwars.com/community")),
                initialOptions: options,
                pullToRefreshController: null,
                onWebViewCreated: (controller) {
                  webViewController = controller;
                },
                onProgressChanged: (controller, progress) {
                  if (progress == 100) {}
                  setState(() {
                    this.progress = progress / 100;
                    urlController.text = url;
                  });
                },
              ),
              progress < 1.0
                  ? LinearProgressIndicator(value: progress)
                  : const SizedBox(),
            ],
          ),
        ),
        WebButtonBar(webViewController: webViewController),
      ],
    );
  }
}
