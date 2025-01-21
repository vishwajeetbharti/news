import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news/module/news/models/article.dart';
import 'package:news/utils/api_end_points.dart';

class NewsProvider with ChangeNotifier {
  List<Article> _articles = [];
  bool _isLoading = false;
  bool _hasError = false;

  List<Article> get articles => _articles;

  bool get isLoading => _isLoading;

  bool get hasError => _hasError;

  Future<void> fetchArticles(String category, {String query = ''}) async {
    _isLoading = true;
    _hasError = false;
    notifyListeners();

    final url = Uri.parse(ApiEndPoints.newsDetailApi(category, query));
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        final List<dynamic> articlesJson = data['articles'];

        _articles = articlesJson.map((json) => Article.fromJson(json)).toList();
      } else {
        _hasError = true;
      }
    } catch (error) {
      _hasError = true;
    }

    _isLoading = false;
    notifyListeners();
  }
}
