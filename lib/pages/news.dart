import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/models/status.dart';
import 'package:news_app/news/news_bloc.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          body: BlocBuilder<NewsBloc, NewsState>(
            builder: (context, state) {
              if(state.status==LoadingStatus.pure){
                context.read<NewsBloc>().add(GetNewsList(onSuccess: (){}, onFailure: (message){}));
                return const SizedBox();
              }
              else if (state.status == LoadingStatus.loading) {
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              } else if (state.status == LoadingStatus.loadedWithSuccess) {
                return ListView.separated(
                    itemBuilder: (_, index) => Container(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  state.news[0].articles[index].urlToImage,
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.news[0].articles[index].title,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      state.news[0].articles[index].description,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                    separatorBuilder: (_, __) => const SizedBox(
                          height: 16,
                        ),
                    itemCount: state.news[0].articles.length);
              }
              else{
                return const SizedBox();
              }
            },
          ),
        );
      }),
    );
  }
}
