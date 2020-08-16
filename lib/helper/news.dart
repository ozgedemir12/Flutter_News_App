import 'dart:convert';

import 'package:news_app1/models/article_models.dart';
import 'package:http/http.dart' as http;

class News {

  List<ArticleModels> news = [];

  Future<void> getNews() async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=tr&category=technology&apiKey=b19832be0ed54e2c89b0bca693bd1262";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null) {
          ArticleModels articlemodels = ArticleModels(
              title: element['title'],
              author: element["author"],
              description: element["description"],
              url: element["url"],
              urlToImage: element["urlToImage"],
              content: element["context"]);

          news.add(articlemodels);
        }
      });
    }
  }
}

class CategoryNewsClass {

  List<ArticleModels> news = [];

  Future<void> getNews(String Category) async {
    String url =
        "http://newsapi.org/v2/top-headlines?category=tr&category&country=technology&apiKey=b19832be0ed54e2c89b0bca693bd1262";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null) {
          ArticleModels articlemodels = ArticleModels(
              title: element['title'],
              author: element["author"],
              description: element["description"],
              url: element["url"],
              urlToImage: element["urlToImage"],
              content: element["context"]);

          news.add(articlemodels);
        }
      });
    }
  }
}
