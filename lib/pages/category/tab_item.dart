import 'package:flutter/material.dart';
import 'package:news_app/core/theme/app_theme.dart';

import '../../models/SourceResponse.dart';

class TabItem extends StatelessWidget {
  bool isSelected;
  Source source;
  TabItem({super.key, required this.isSelected, required this.source});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: theme.primaryColor, width: 3),
          color: isSelected ? theme.primaryColor : Colors.transparent),
      child: Text(
        source.name ?? '',
        style: TextStyle(
            fontSize: 16,
            color: isSelected ? AppTheme.whiteColor : theme.primaryColor),
      ),
    );
  }
}
