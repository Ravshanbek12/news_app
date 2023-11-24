import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article.dart';

import '../pages/news.dart';
import '../pages/news_single.dart';
import '../pages/splash.dart';

abstract class AppRouts {
  static Route<dynamic> router(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return CupertinoPageRoute(
          builder: (_) => const SplashScreen(),
        );

      case '/news':
        return CupertinoPageRoute(
          builder: (_) => const NewsScreen(),
        );

      case '/news_single':
        final arguments = settings.arguments;
        final article = arguments as ArticleModel;
        return CupertinoPageRoute(
          builder: (_) =>  NewsSingleScreen(article: article,),
        );

      // case '/news_single':
      //   return CupertinoPageRoute(builder: (_)=>const NewsSingleScreen());

      default:
        return CupertinoPageRoute(builder: (_) => const Scaffold());
    }
  }
}
