import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/models/SourceResponse.dart';
import 'package:news_app/pages/home/widgets/custom_drawer.dart';

class CategoryDetails extends StatelessWidget {
  static const String routeName = 'categoryDetails';
  const CategoryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: AssetImage('assets/images/pattern.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            'News App',
            style: theme.textTheme.titleLarge,
          ),
        ),
        body: FutureBuilder<SourceResponse?>(
            future: ApiManager.getSources(),
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
                    ElevatedButton(onPressed: () {}, child: Text('Try again'))
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
              return ListView.builder(itemBuilder: (context , index){
                     return Text(sourceList[index].name ?? '',
                     style: TextStyle(
                       color: Colors.black
                     ),
                     );
              },
              itemCount: sourceList.length,
              );
            }),
        drawer: CustomDrawer(),
      ),
    );
  }
}
