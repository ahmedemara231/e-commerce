import 'package:flutter/material.dart';
import 'package:shop_app/view/home_screen/4_screens/home/Category_model.dart';
import 'package:shop_app/view/home_screen/4_screens/home/home.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          itemBuilder: (context, index) => InkWell(
            onTap: () {},
            child: CategoriesModel(
              imageUrl: '${categoryModel?.data['data'][index]['image']}',
              categoryName: '${categoryModel?.data['data'][index]['name']}',
            ),
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 15,),
          itemCount: (categoryModel?.data['data'] as List).length
      ),
    );
  }
}
