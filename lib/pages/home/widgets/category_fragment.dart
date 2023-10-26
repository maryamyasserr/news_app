import 'package:flutter/material.dart';
import 'package:news_app/models/CategoryFragment.dart';
import 'package:news_app/pages/home/widgets/category_item.dart';

class CategoryFragment extends StatelessWidget {
  var categoriesList = CategoryFragmentData.getCategories();
  Function onCategoryClick;
  CategoryFragment({
    required this.onCategoryClick,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Pick your category \n of interest',
          style: theme.textTheme.titleMedium ,
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
               crossAxisCount: 2,
               mainAxisSpacing: 18,
               crossAxisSpacing: 18,
            ),
              itemBuilder : (context , index){
                  return InkWell(
                    onTap: (){
                      onCategoryClick(categoriesList[index]);
                    },
                    child: CategoryItem(
                        categoryFragment: categoriesList[index],
                        index: index),
                  );
              },
              itemCount: categoriesList.length ,
            ),
          )
        ],
      ),
    );
  }
}
