import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewFlutter extends StatefulWidget {
  var storeLink;
  WebViewFlutter(this.storeLink);

  @override
  State<WebViewFlutter> createState() => _WebViewFlutterState();
}

class _WebViewFlutterState extends State<WebViewFlutter> {

  @override
  void initState(){
    super.initState();
    // widget.categoryServiceController.getCategoryData();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }


  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: widget.storeLink,
      appBar: new AppBar(
        backgroundColor: Colors.white,
        // title: const Text('Resta'),
      ),
      withZoom: true,
      withLocalStorage: true,
      withJavascript: true,
      appCacheEnabled: true,
      // initialChild: Container(
      //   color: Colors.redAccent,
      //   child: const Center(
      //     child: Text('Waiting.....'),
      //   ),
      // ),
    );
  }
}