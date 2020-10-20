import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final String url = ModalRoute.of( context ).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text( url ),
      ),
      body: SafeArea(
        bottom: false,
        child: WebView(
          initialUrl: url,
          javascriptMode: JavascriptMode.unrestricted,
        )
      ),
    );
  }
}