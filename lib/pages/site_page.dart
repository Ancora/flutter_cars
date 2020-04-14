import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SitePage extends StatelessWidget {
  WebViewController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 0, 0, 100),
            Color.fromARGB(255, 0, 0, 150),
            Color.fromARGB(255, 0, 0, 100),
          ],
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Site Oficial'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: _onClickRefresh,
            )
          ],
        ),
        body: WebView(
          initialUrl: 'https://ancora.eti.br',
          onWebViewCreated: (controller) {
            this.controller = controller;
          },
          navigationDelegate: (request) {
            return NavigationDecision.navigate;
          },
        ),
      ),
    );
  }

  void _onClickRefresh() {
    this.controller.reload();
  }
}
