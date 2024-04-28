import "package:flutter/material.dart";
import "package:news_api_flutter_package/news_api_flutter_package.dart";
import 'package:news_api_flutter_package/model/article.dart';
import 'package:news_api_flutter_package/news_api_flutter_package.dart';
import 'dart:convert';
import 'package:news_api_flutter_package/news_api_flutter_package.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:news_api_flutter_package/news_api_flutter_package.dart';
import 'package:madsocialproj2/widgets/topnewswidget.dart';
//contains functions for article retrieval from news api

class NewsScreen extends StatelessWidget {
  final NewsAPI _newsAPI = NewsAPI(apiKey: "97ea86b0e6a54716b4901929d9d26289");

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text("Top Worldwide Headlines"),
      bottom: _buildTabBar(),
    );
  }

  TabBar _buildTabBar() {
    return TabBar(
      tabs: [
        Tab(text: "Top Headlines"),
      ],
    );
  }

  Widget _buildBody() {
    return TabBarView(
      children: [
        TopHeadlinesTabBody(newsAPI: _newsAPI),
      ],
    );
  }
}
