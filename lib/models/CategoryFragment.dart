import 'package:flutter/material.dart';

class CategoryFragmentData {
  String id;
  String title;
  String image;
  Color color;

  CategoryFragmentData({
    required this.id,
    required this.title,
    required this.image,
    required this.color});

  /*
      business entertainment general
      health science sports technology
  */

  static List<CategoryFragmentData> getCategories (){
    return [
      CategoryFragmentData(
          id: 'sports', title: 'Sports', image: 'assets/images/sports.png',
          color: const Color(0xffC91C22),
      ),
      CategoryFragmentData(
        id: 'general', title: 'Politics', image: 'assets/images/politics.png',
        color: const Color(0xff003E90),
      ),
      CategoryFragmentData(
        id: 'health', title: 'Health', image: 'assets/images/health.png',
        color: const Color(0xffED1E79),
      ),
      CategoryFragmentData(
        id: 'business', title: 'Business', image: 'assets/images/bussines.png',
        color: const Color(0xffCF7E48),
      ),
      CategoryFragmentData(
        id: 'entertainment', title: 'Environment', image: 'assets/images/environment.png',
        color: const Color(0xff4882CF),
      ),
      CategoryFragmentData(
        id: 'science', title: 'Science', image: 'assets/images/science.png',
        color: const Color(0xffF2D352),
      ),
      CategoryFragmentData(
        id: 'technology', title: 'Technology', image: 'assets/images/science.png',
        color: const Color(0xff39A552),
      ),
    ];
  }
}