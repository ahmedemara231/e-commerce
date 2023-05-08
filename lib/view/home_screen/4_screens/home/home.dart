import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/API/Repository.dart';
import 'package:shop_app/API/models/Category%20Products.dart';
import 'package:shop_app/API/models/Home_model.dart';
import 'package:shop_app/view/home_screen/4_screens/favourates.dart';
import 'package:shop_app/view/home_screen/4_screens/home/Category_model.dart';
import 'package:shop_app/view/home_screen/4_screens/home/item_details.dart';

List<Map<String,dynamic>> favItems = [];
HomeModel? categoryModel;
class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isFavourate = false;
  bool loading = true;
  Repo repo = Repo();
  HomeModel? homeData;
  int? favItemIndex;
  void getHomeData()async
  {
    homeData = await repo.getHomeData();
    categoryModel = await repo.getCategory();
    setState(() {
      loading = false;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHomeData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: loading ? const Center(
          child: Text(
            'Loading...',
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500
      ),)) : SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(3),
          child: Column(
          children: [
            CarouselSlider(
                items: (homeData?.data['banners'] as List).map(
                        (e) => Image.network(
                            '${e['image']}',
                          fit: BoxFit.contain,
                        )).toList(),
                  // Image.network('${homeData?.data['products'][0]['image']}'),
                options: CarouselOptions(
                  autoPlay: true,
                  enableInfiniteScroll: true,
                  viewportFraction: 1,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayCurve: Curves.easeOutCirc
                )
            ),
            const SizedBox(height: 15,),
            SizedBox(
              width: double.infinity,
              height: 100,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => CategoriesModel(
                      categoryName: '${categoryModel?.data['data'][index]['name']}',
                      imageUrl: '${categoryModel?.data['data'][index]['image']}'),
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 10,
                  ),
                  itemCount: (categoryModel?.data['data'] as List).length
              ),
            ),
            const SizedBox(height: 20,),
            Expanded(
              child: GridView.count(
                physics: const BouncingScrollPhysics(),
                // physics: const NeverScrollableScrollPhysics(),
                // shrinkWrap: true,
                childAspectRatio: 1/1.6,
                mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  crossAxisCount: 2,
                children: List.generate( (homeData?.data['banners'] as List).length,
                        (index) => Column(
                          children:
                          [
                            InkWell(
                              onTap: ()
                              {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ItemDetails(itemModel: homeData?.data['products'][index]),
                                    ),
                                );
                               // log('${homeData?.data['products'][index]['price']}');
                              },
                              child: Card(
                                elevation: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:
                                  [
                                    Image.network('${homeData?.data['products'][index]['image']}',
                                       height: 200,
                                       width: 200,
                                    ),
                                    if(homeData?.data['products'][index]['discount'] != 0)
                                      Container(
                                        child: const Text(
                                            'Discount',
                                          style: TextStyle(
                                            color: Colors.white
                                          ),
                                        ),
                                        color: Colors.red,
                                      ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text('${homeData?.data['products'][index]['name']}',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis ,
                                  ),
                                    Row(
                                      children: [
                                        Text('${homeData?.data['products'][index]['price']}',
                                          style: const TextStyle(
                                            color: Colors.blue
                                          ),
                                        ),
                                        const Spacer(),
                                        if(homeData?.data['products'][index]['discount'] != 0)
                                          Text(
                                            '${homeData?.data['products'][index]['old_price']}',
                                          style: const TextStyle(
                                            color: Colors.grey,
                                            decoration: TextDecoration.lineThrough
                                          ),
                                        ),
                                        const Spacer(flex: 4,),
                                         IconButton(
                                           onPressed: ()
                                           {

                                             favItems.add(homeData?.data['products'][index]);
                                             log('${favItems.length}');
                                           },
                                             icon: const Icon(
                                               Icons.favorite,
                                               size: 17,
                                               color: Colors.grey,
                                         )
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ),
          ],
           ),
          ),
        ),
      );
  }
}
