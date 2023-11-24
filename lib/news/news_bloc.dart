import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:news_app/models/article.dart';

import '../models/news.dart';
import '../models/status.dart';

part 'news_event.dart';

part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc()
      : super(
          const NewsState(
            status: LoadingStatus.pure,
            news: [],
          ),
        ) {
    on<GetNewsList>((event, emit) async {
      emit(state.copyWith(status: LoadingStatus.loading));

      try {
        await Future.delayed(const Duration(seconds: 4));

        final newsList = [
          NewsModel(articles: [
            ArticleModel(
                author: "Juli Clover",
                title:
                    "Instagram Adds New Filters, Support for Custom Stickers From Photos",
                description:
                    "Popular social network Instagram was today updated with a number of improvements that are designed to give users more ways to edit their content before sharing it.\n\n\n\n\n\nInstagram has added more than 20 new filters that can be used to tweak the look of images,…",
                urlToImage:
                    "https://images.macrumors.com/t/5uTtnN9sFarIGArnR_V5kOmf3io=/2250x/article-new/2021/03/Instagram-Feature-2.jpg",
                publishedAt: "2023-11-15T20:32:18Z",
                content:
                    "Popular social network Instagram was today updated with a number of improvements that are designed to give users more ways to edit their content before sharing it.\r\nInstagram has added more than 20 n… [+1447 chars]")
          ], status: "ok", totalResults: 35)
        ];

        emit(state.copyWith(status: LoadingStatus.loadedWithSuccess,news: newsList));
      } catch (e) {
        emit(state.copyWith(status: LoadingStatus.loadedWithFailure));
      }
    });
  }
}
