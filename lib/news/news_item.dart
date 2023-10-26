import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/NewsResponse.dart';

class NewsItem extends StatelessWidget {
  NewsItem({
    super.key,
    required this.news
  });
  News news;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child : CachedNetworkImage(
              imageUrl: news.urlToImage ?? '',
              placeholder: (context, url) => Center(child: CircularProgressIndicator(
                color: theme.primaryColor,
              )),
              errorWidget: (context, url, error) => Icon(Icons.error ,
              color: theme.primaryColor,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(news.author ?? '',
          style: theme.textTheme.titleSmall,
          ),
          const SizedBox(height: 5),
          Text(news.title ?? '',
            style: theme.textTheme.bodySmall,
          ),
          const SizedBox(height: 5),
          Text(news.publishedAt ?? '',
            style: theme.textTheme.titleSmall,
            textAlign: TextAlign.end,
          ),

        ],
      ),
    );
  }
}
