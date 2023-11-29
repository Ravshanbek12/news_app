import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:news_app/news/news_bloc.dart';


class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          body: StreamBuilder<InternetConnectionStatus>(
            stream: InternetConnectionChecker().onStatusChange,
            builder: (context, snapshot) {
             if(snapshot.data == InternetConnectionStatus.connected){
               return const Text("Internet is on");

             }
             else if(snapshot.data == InternetConnectionStatus.disconnected){
               return const Text("Internet is off");
             }
             return Container();
            }
          ),
        );
      }),
    );
  }
}


