import 'package:flutter/material.dart';
import 'package:prak5_mg6_network/data/model/article.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleWebView extends StatelessWidget {
  static const routeName = '/article_web';
  final String url;

  const ArticleWebView(Article arguments, {required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'News App',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}
