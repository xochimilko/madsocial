import 'package:flutter/material.dart';
import 'package:news_api_flutter_package/model/article.dart';
import 'package:news_api_flutter_package/model/error.dart';
import 'package:news_api_flutter_package/news_api_flutter_package.dart';
import 'package:madsocialproj2/widgets/loadingwidget.dart';
import 'package:madsocialproj2/widgets/errorwidget.dart';
import 'package:madsocialproj2/widgets/articleswidget.dart';

class TopHeadlinesTabBody extends StatelessWidget {
  const TopHeadlinesTabBody({required this.newsAPI, super.key});

  final NewsAPI newsAPI;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Article>>(
      future: newsAPI.getTopHeadlines(country: "us"),
      builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
        return snapshot.connectionState == ConnectionState.done
            ? snapshot.hasData
                ? ArticleListVIew(articles: snapshot.data!)
                : ApiErrorWidget(error: snapshot.error as ApiError)
            : ProgressWidget();
      },
    );
  }
}
