import 'dart:io';

import 'package:flutter/material.dart';
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
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WebView(
         initialUrl: widget.storeLink != "" ? widget.storeLink : 'https://myvyavsay.com/',
       ),
    );
  }
}