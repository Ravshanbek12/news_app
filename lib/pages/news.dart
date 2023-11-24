import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/models/status.dart';
import 'package:news_app/news/news_bloc.dart';

import '../widgets/news_item.dart';

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
                context.read<NewsBloc>().add(GetNewsList(onSuccess: (){
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Hammasi chiki chiki")));
                }, onFailure: (message){}));
                return const SizedBox();
              }
              else if (state.status == LoadingStatus.loading) {
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              } else if (state.status == LoadingStatus.loadedWithSuccess) {
                return ListView.separated(
                  // physics: const ScrollPhysics(),
                    itemBuilder: (_, index) => NewWidget(article:state.news[0].articles[index]),
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


