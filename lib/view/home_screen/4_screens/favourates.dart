import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shop_app/API/models/Home_model.dart';
import 'package:shop_app/view/home_screen/4_screens/home/home.dart';

class Favourates extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // ListView.separated(
          //     itemBuilder: (context, index) => Card(
          //       child: ListTile(
          //         leading: SizedBox(
          //           width: 100,
          //             height: 100,
          //             child: Image.network('${favItems[index]['image']}')),
          //         title: Text('${favItems[index]['price']}'),
          //       ),
          //     ),
          //     separatorBuilder: (context, index) => const SizedBox(height: 16,),
          //     itemCount: favItems.length
          // ),
        ],
      )
    );
  }
}
