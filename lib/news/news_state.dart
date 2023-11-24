part of 'news_bloc.dart';

class NewsState {
  final LoadingStatus status;
  final List<NewsModel> news;
  const NewsState({
    required this.status,
    required this.news,
  });

  NewsState copyWith({
    LoadingStatus? status,
    List<NewsModel>? news,
  }) {
    return NewsState(
      status: status ?? this.status,
      news: news ?? this.news,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NewsState &&
        other.status == status &&
        listEquals(other.news, news);
  }

  @override
  int get hashCode => status.hashCode ^ news.hashCode;
}