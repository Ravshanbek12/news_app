part of 'news_bloc.dart';

sealed class NewsEvent{}

class GetNewsList extends NewsEvent{
  final Function() onSuccess;
  final Function(String errorMessage) onFailure;

  GetNewsList({required this.onSuccess,required this.onFailure});
}
