import 'package:flutter/material.dart';
import 'package:shop_app/API/Repository.dart';
import 'package:shop_app/API/models/Category%20Products.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  Repo repo = Repo();
  CategoryModel? categoryModel;
  Future<void> getData()async
  {
    categoryModel = await repo.getCategoryProducts();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextButton(onPressed: () {
            print(categoryModel?.status);
          }, child: Text('يا رب الداتا تيجي'))
        ],
      ),
    );
  }
}
