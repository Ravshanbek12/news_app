import 'article.dart';

class NewsModel{
  final String status;
  final int totalResults;
  final List<ArticleModel> articles;

  NewsModel({required this.articles,required this.status,required this.totalResults});

}