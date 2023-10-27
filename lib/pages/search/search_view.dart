import 'package:flutter/material.dart';
import 'package:news_app/core/theme/app_theme.dart';

import '../../api/api_manager.dart';
import '../../models/NewsResponse.dart';
import '../../news/news_item.dart';

class SearchView extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            showResults(context);
          },
          icon: const Icon(Icons.search))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.close));
  }

  @override
  Widget buildResults(BuildContext context) {
    var theme = Theme.of(context);
    return buildSuggestions(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var theme = Theme.of(context);
    return query.isEmpty
        ? Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  image: AssetImage('assets/images/pattern.png'),
                  fit: BoxFit.cover),
            ),
          )
        : FutureBuilder<NewsResponse?>(
            future: ApiManager.getNewsBySearchQuery(query),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: theme.primaryColor,
                  ),
                );
              }
              else if (snapshot.hasError) {
                return Column(
                  children: [
                    const Text('Something went wrong'),
                    ElevatedButton(
                        onPressed: () {}, child: const Text('Try again'))
                  ],
                );
              }
              if (snapshot.data?.status != 'ok') {
                return Column(
                  children: [
                    Text(snapshot.data?.message ?? ''),
                    ElevatedButton(
                        onPressed: () {
                          ApiManager.getNewsBySearchQuery(query);
                        }, child: const Text('Try again'))
                  ],
                );
              }
              var newsList = snapshot.data?.articles ?? [];
              return ListView.builder(
                itemBuilder: (context, index) {
                  return NewsItem(news: newsList[index]);
                },
                itemCount: newsList.length,
              );
            });
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return AppTheme.lightMode;
  }
}
