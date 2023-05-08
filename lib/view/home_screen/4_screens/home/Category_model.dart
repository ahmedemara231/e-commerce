import 'package:flutter/material.dart';

class CategoriesModel extends StatelessWidget {
  String? imageUrl;
  String? categoryName;
   CategoriesModel({Key? key,
     this.imageUrl,
     this.categoryName
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Image.network(imageUrl!),
          Container(
            // width: double.infinity,
            child: Text(
              categoryName!,
              style: const TextStyle(color: Colors.white,),),
            color: Colors.black54,
          )
        ],
      );
  }
}
