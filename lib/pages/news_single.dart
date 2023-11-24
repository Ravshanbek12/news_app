import 'package:flutter/material.dart';
import 'package:news_app/models/article.dart';

class NewsSingleScreen extends StatelessWidget {

  final ArticleModel article;

  const NewsSingleScreen({Key? key,required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Title"),
      ),
      body: ListView(
        children: [
          Hero(
            tag: article.urlToImage,
            child: Image.network(
              article.urlToImage,
              height: 300,
              width: double.maxFinite,
              fit: BoxFit.cover,
            ),
          ),
          Text(article.description),
          Text(article.content),
        ],
      ),
    );
  }
}
