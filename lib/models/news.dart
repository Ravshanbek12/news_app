import 'article.dart';

class NewsModel {
  final String status;
  final int totalResults;
  final List<ArticleModel> articles;

  NewsModel(
      {required this.articles,
      required this.status,
      required this.totalResults});

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      status: json["status"]?? '',
      totalResults: json["totalResults"]?? 0,
      articles: (json["articles"] as List).map(
        (e) => ArticleModel(
          author: e['author']?? '',
          title: e['title']?? '',
          description: e['description']?? '',
          urlToImage: e['urlToImage']?? '',
          publishedAt: e['publishedAt']?? '',
          content: e['content']?? '',
        ),
      ).toList(),
    );
  }
}
