import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/models/CategoryFragment.dart';
import 'package:news_app/models/SourceResponse.dart';
import 'package:news_app/pages/category/tab_widget.dart';
import 'package:news_app/pages/home/widgets/custom_drawer.dart';

class CategoryDetails extends StatefulWidget {
  CategoryFragmentData category;
  static const String routeName = 'categoryDetails';
  CategoryDetails({super.key,
  required this.category
  });

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: AssetImage('assets/images/pattern.png'), fit: BoxFit.cover),
      ),
        child : FutureBuilder<SourceResponse?>(
            future: ApiManager.getSources(widget.category.id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: theme.primaryColor,
                  ),
                );
              } else if (snapshot.hasError) {
                return Column(
                  children: [
                    Text('Something went wrong'),
                    ElevatedButton(onPressed: () {
                      ApiManager.getSources(widget.category.id);
                    }, child: Text('Try again'))
                  ],
                );
              }
              if (snapshot.data?.status != 'ok') {
                // error , message, code
                return Column(
                  children: [
                    Text(snapshot.data?.message ?? ''),
                    ElevatedButton(onPressed: () {}, child: Text('Try again'))
                  ],
                );
              }
              var sourceList = snapshot.data?.sources ?? [];
              return TabWidget(sourcesList: sourceList);
            }),

    );
  }
}
