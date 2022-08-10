import 'dart:convert';
import 'dart:developer';

import 'package:bloc_sampel/model/news_model.dart';
import 'package:http/http.dart' as http;

class NewsDataService {
  Future<NewsModel?> fetchNewsData() async {
    try {
      String url =
          "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=33e9f2cc8f6b44ecb2c83eafead86359";
      var response = await http.get(Uri.parse(url));
      var jsonData = jsonDecode(response.body);
      NewsModel newsData = NewsModel.fromJson(jsonData);
      log(newsData.totalResults.toString());
      return newsData;
    } catch (e) {
      return null;
    }
  }
}
