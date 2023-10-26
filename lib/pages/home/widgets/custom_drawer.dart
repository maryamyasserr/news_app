import 'package:flutter/material.dart';
import 'package:news_app/core/theme/app_theme.dart';
import 'package:news_app/pages/settings/settings_view.dart';

class CustomDrawer extends StatelessWidget {
  static const int categoriesId = 1;
  static const int settingsId = 2;
  Function onDrawerClick ;
  CustomDrawer({
    super.key,
    required this.onDrawerClick,
  });

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Container(
      width: mediaQuery.width * 0.7,
      color: AppTheme.whiteColor,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: mediaQuery.width * 0.7 ,
            height: mediaQuery.height * 0.135,
            color: theme.primaryColor,
            child: Text('News App !',
            style: theme.textTheme.titleLarge,
            ),
          ),
          InkWell(
            onTap: (){
              onDrawerClick(CustomDrawer.categoriesId);
            },
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  Icon(Icons.list,size: 38),
                  SizedBox(width: 12),
                  Text('Categories',
                  style: theme.textTheme.bodyLarge,
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              onDrawerClick(CustomDrawer.settingsId);
            },
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  Icon(Icons.settings,size: 38),
                  SizedBox(width: 16),
                  Text('Settings',
                    style: theme.textTheme.bodyLarge,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
