import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:star_wars_app/src/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);

  runApp(const MyApp());
}
