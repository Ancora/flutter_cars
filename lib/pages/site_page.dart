import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SitePage extends StatefulWidget {
  @override
  _SitePageState createState() => _SitePageState();
}

class _SitePageState extends State<SitePage> {
  WebViewController controller;
  //var _stackIdx = 1;
  var _showProgress = true;

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
      //padding: const EdgeInsets.all(16),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Site Oficial'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: _onClickRefresh,
            )
          ],
        ),
        body: _webView(),
      ),
    );
  }

  void _onClickRefresh() {
    this.controller.reload();
  }

  _webView() {
    return Stack(
      //index: _stackIdx,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 0, 0, 100),
                Color.fromARGB(255, 0, 0, 150),
                Color.fromARGB(255, 0, 0, 100),
              ],
            ),
          ),
          child: Column(
            children: <Widget>[
              Expanded(
                child: WebView(
                  javascriptMode: JavascriptMode.unrestricted,
                  initialUrl: 'https://ancora.eti.br',
                  onPageFinished: _onPageFinished,
                ),
              ),
            ],
          ),
        ),
        Opacity(
          opacity: _showProgress ? 1 : 0,
          /* child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 0, 0, 100),
                  Color.fromARGB(255, 0, 0, 150),
                  Color.fromARGB(255, 0, 0, 100),
                ],
              ),
            ), */
          child: Center(
            child: CircularProgressIndicator(),
          ),
          //),
        ),
      ],
    );
  }

  void _onPageFinished(String url) {
    setState(() {
      //_stackIdx = 0;
      _showProgress = false;
    });
  }
}
