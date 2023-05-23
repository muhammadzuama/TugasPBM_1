import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sehatin/Artikel/model/articel.model.dart';

class ApiService {
  final endPointUrl =
      "https://newsapi.org/v2/everything?q=farmer&from=2023-05-1&sortBy=publishedAt&apiKey=4fdd6f805d8f4756b6b6fba463776d43";

  Future<List<ArticleModel>> getArtikel() async {
    http.Response response = await http.get(Uri.parse(endPointUrl));

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);

      List<dynamic> articles = json['articles'];

      List<ArticleModel> articleList =
          articles.map((dynamic item) => ArticleModel.fromJson(item)).toList();

      return articleList;
    } else {
      throw ("Can't get the Articles");
    }
  }
}
