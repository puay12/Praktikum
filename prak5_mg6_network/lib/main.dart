import 'package:flutter/material.dart';
import 'package:prak5_mg6_network/ui/article_detail_page.dart';
import 'package:prak5_mg6_network/ui/article_list_page.dart';
import 'package:prak5_mg6_network/ui/article_web_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => ArticleListPage(),
        '/article_web' : (context) => ArticleWebView(),
        '/article_detail' : (context) => ArticleDetailPage(),
      },
    );
  }
}