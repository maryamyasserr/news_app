import 'package:flutter/material.dart';
import 'package:news_app/models/CategoryFragment.dart';
import 'package:news_app/pages/category/category_details.dart';
import 'package:news_app/pages/home/widgets/category_fragment.dart';
import 'package:news_app/pages/home/widgets/custom_drawer.dart';
import 'package:news_app/pages/search/search_view.dart';
import 'package:news_app/pages/settings/settings_view.dart';

class HomeView extends StatefulWidget {
  static const String routeName = 'Home';
   HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage('assets/images/pattern.png'),
                fit: BoxFit.cover
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text(
                selectedDrawer == CustomDrawer.settingsId
                    ? 'Settings'
               : selectedCategory == null
                    ? 'News App'
                    : selectedCategory!.title ,
              style: theme.textTheme.titleLarge,
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: InkWell(
                    onTap: (){
                      showSearch(
                          context: context,
                          delegate: SearchView());
                    },
                    child: Icon(Icons.search,
                    size: 30,

                    ),
                  ),
                )
              ],
            ),
            body: selectedDrawer == CustomDrawer.settingsId
                ? SettingsView()
                :
            selectedCategory == null
                ? CategoryFragment(onCategoryClick: onCategoryClick ,)
                : CategoryDetails(category: selectedCategory !),
            drawer: CustomDrawer(onDrawerClick: onDrawerClick),
          ),
        );
  }

  CategoryFragmentData? selectedCategory;
  void onCategoryClick(CategoryFragmentData newSelectedCategory){
       selectedCategory = newSelectedCategory;
       setState(() {

       });
  }


  int selectedDrawer = CustomDrawer.categoriesId;
  void onDrawerClick(int newSelectedDrawer){
    selectedDrawer = newSelectedDrawer ;
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {

    });
  }
}