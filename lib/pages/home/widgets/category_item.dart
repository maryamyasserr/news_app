import 'package:flutter/material.dart';
import 'package:news_app/models/CategoryFragment.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem({
    super.key,
    required this.categoryFragment,
    required this.index
  });
  CategoryFragmentData categoryFragment;
  int index;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(11),
      decoration: BoxDecoration(
        color: categoryFragment.color ,
        borderRadius:  BorderRadius.only(
          topRight: const Radius.circular(20),
          topLeft: const Radius.circular(20),
          bottomLeft: Radius.circular(index % 2 == 0 ? 20 : 0),
          bottomRight: Radius.circular(index % 2 == 0 ? 0 : 20),
        ),
      ),
      child: Column(
        children: [
          Image.asset(categoryFragment.image,
          height: MediaQuery.of(context).size.height *0.13,
          ),
          const SizedBox(height: 5),
          Text(categoryFragment.title,
          style: theme.textTheme.bodyLarge!.copyWith(
            color: Colors.white
          ),
          ),
        ],
      ),
    );
  }
}
