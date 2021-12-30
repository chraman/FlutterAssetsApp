import 'package:flutter/material.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Bungee',
        primaryTextTheme: TextTheme(
          subtitle1: TextStyle(color: Colors.yellow, fontSize: 24),
        ),
      )));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new AfterSplash();
  }
}

class AfterSplash extends StatefulWidget {
  @override
  _MyAppsState createState() => _MyAppsState();
}

class _MyAppsState extends State<AfterSplash> {
  late WebViewPlusController controller;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        this.controller!.webViewController!.goBack();
        return false;
      },
      child: WebViewPlus(
        // Enter your custom url
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: "assets/website/index.html",
        onWebViewCreated: (controller) {
          this.controller = controller;
        },
      ),
    );
  }
}