import 'package:flutter/material.dart';
import 'package:news_app/news/news_details.dart';
import 'package:news_app/pages/category/tab_item.dart';

import '../../models/SourceResponse.dart';

class TabWidget extends StatefulWidget {
  TabWidget({
    super.key,
    required this.sourcesList,
  });
  List<Source> sourcesList = [];

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sourcesList.length,
      child: Column(
        children: [
          TabBar(
              onTap: (index){
                  selectedIndex = index;
                  setState(() {

                  });
              } ,
              isScrollable: true,
              indicatorColor: Colors.transparent,
              tabs: widget.sourcesList.map((source) => TabItem(
                  isSelected: selectedIndex == widget.sourcesList.indexOf(source),
                  source: source)).toList()
          ),
          Expanded(child: NewsDetails(source: widget.sourcesList[selectedIndex]))
        ],
      ),
    );
  }
}
