import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../models/news.dart';
import '../models/status.dart';


part 'news_state.dart';

class NewsBloc extends Cubit< NewsState> {
  NewsBloc()
      : super(
          const NewsState(
            status: LoadingStatus.pure,
            news: [],
          ),
        ) {
    // on<GetNewsList>((event, emit) async {
    //   emit(state.copyWith(status: LoadingStatus.loading));
    //
    //   try {
    //     await Future.delayed(const Duration(seconds: 4));
    //
    //     final dio = Dio();
    //
    //     final response = await dio.get(
    //         "https://newsapi.org/v2/everything?q=keyword&apiKey=38ea3b90702044ee88f5b6e5396cf1a5");
    //     print(response.data);
    //
    //     final news = NewsModel.fromJson(response.data);
    //
    //
    //     emit(state.copyWith(
    //         status: LoadingStatus.loadedWithSuccess, news: [news]));
    //     event.onSuccess;
    //   } catch (e) {
    //     emit(state.copyWith(status: LoadingStatus.loadedWithFailure));
    //     event.onFailure('$e');
    //   }
    // });
  }

  Future<void> getNews({required Function() onSuccess,required Function(String errorMessage) onFailure})async{
    emit(state.copyWith(status: LoadingStatus.loading));

    try {


          final dio = Dio();

          final response = await dio.get("https://newsapi.org/v2/everything?q=keyword&apiKey=38ea3b90702044ee88f5b6e5396cf1a5");

          final news = NewsModel.fromJson(response.data);

      emit(state.copyWith(status: LoadingStatus.loadedWithSuccess,news: [news]));
      onSuccess();
    }
        catch(e){
      emit(state.copyWith(status: LoadingStatus.loadedWithFailure));
        }

  }
}
