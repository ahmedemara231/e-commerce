import 'package:flutter/material.dart';
import 'package:shop_app/view/home_screen/4_screens/categories.dart';
import 'package:shop_app/view/home_screen/4_screens/favourates.dart';
import 'package:shop_app/view/home_screen/4_screens/home/cart.dart';
import 'package:shop_app/view/home_screen/4_screens/home/home.dart';
import 'package:shop_app/view/home_screen/4_screens/Setting/settings.dart';

import '4_screens/home/item_details.dart';

class HomeScreen extends StatefulWidget {
  String? name;

  HomeScreen({Key? key,
    this.name
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> screens =
  [
    Home(),
    const Categories(),
    Favourates(),
    const Settings(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Cart(),));
                }, icon: const Icon(Icons.shopping_cart))
        ],
        elevation: 0,
        title: Text(
          'Hello ${widget.name}',
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey,
        currentIndex: currentIndex,
        onTap: (index)
        {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.category_rounded),
              label: 'Categories'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorites'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings'
          ),
        ],
      ),
      body: screens[currentIndex],
    );
  }
}
