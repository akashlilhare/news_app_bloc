import 'package:bloc_sampel/bloc/load_data_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/news_model.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    BlocProvider.of<LoadDataBloc>(context).add(LoadNewsData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text("News App"),
      ),
      body: BlocBuilder<LoadDataBloc, LoadDataState>(
        builder: (context, state) {
          if (state is LoadDataLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is LoadDataSuccessful) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  ...state.newsData.articles.map((e) => BuildCard(
                        articles: e,
                      ))
                ],
              ),
            );
          } else {
            return Center(
              child: Text(state.toString()),
            );
          }
        },
      ),
    );
  }
}

class BuildCard extends StatelessWidget {
  final Articles articles;

  const BuildCard({Key? key, required this.articles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Card(
        child: Container(
          padding: EdgeInsets.only(left: 12, right: 12, bottom: 12),
          child: Column(
            children: [
              Image.network(articles.urlToImage),
              SizedBox(
                height: 8,
              ),
              Text(
                articles.title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(articles.description)
            ],
          ),
        ),
      ),
    );
  }
}
