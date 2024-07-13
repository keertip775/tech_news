import 'dart:convert';

import 'package:get/get.dart';
import 'package:tech_news/models/news.dart';
import 'package:http/http.dart' as http;
class NewsController  {
 Future<List<Article>> getTopHeadlines() async {
    try {
      final response = await http.get(Uri.parse("https://newsapi.org/v2/top-headlines?country=in&apiKey=f31069a38cd349ff92f38f05211f2179&category=technology"));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        List<Article> articles = (jsonData['articles'] as List)
            .map((articleJson) => Article.fromJson(articleJson))
            .toList();
        return articles;
      } else {
        throw Exception('Failed to load news');
      }
    } catch (e) {
      throw Exception('Failed to load news: $e');
    }
  }






}