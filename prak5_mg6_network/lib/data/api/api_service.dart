import 'package:prak5_mg6_network/data/model/article.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static final String _baseUrl = 'https://newsapi.org/v2/';
  static final String _apiKey = 'e00208fb2dae44fab98aac2484f9c44c';
  static final String _category = 'business';
  static final String _country = 'id';

  Future<ArticleResult> topHeadlines() async {
    final response = await http.get(Uri.parse(_baseUrl +
        "top-headlines?country=$_country&category=$_category&apiKey=$_apiKey"));
    if (response.statusCode == 200) {
      return ArticleResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load top headlines');
    }
  }
}
