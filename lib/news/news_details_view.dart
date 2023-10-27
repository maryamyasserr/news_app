import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/NewsResponse.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailsView extends StatelessWidget {
  static const String routeName = 'NewsDetailsView';
  const NewsDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    var news = ModalRoute.of(context)!.settings.arguments as News;
    var theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: AssetImage('assets/images/pattern.png'),
            fit: BoxFit.cover
        ),
      ),
      child: Scaffold(
             backgroundColor: Colors.transparent,
             appBar: AppBar(
               title: Text('News Details !',
               style: theme.textTheme.titleLarge,
               ),
             ),
            body: SingleChildScrollView(
              child: Container(
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
                    const SizedBox(height: 20),
                    Text(news.content ?? '',
                      style: theme.textTheme.bodySmall!.copyWith(
                        color: const Color(0xffA3A3A3)
                      ),
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: (){
                          launchNewsUrl(news.url ?? '');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('View Full Article',
                            style: theme.textTheme.bodySmall,
                            textAlign: TextAlign.end,
                          ),
                          const SizedBox(width: 5),
                          ImageIcon(AssetImage('assets/images/arrow_icon.png',),
                            size: 30,
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
    )
    );
  }

  Future<void> launchNewsUrl(String url) async {
    var uri =Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }
  }

