import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/Login_Registration_screens/login_screen.dart';
import 'package:shop_app/shared_prefs/shared_prefs.dart';
import 'package:shop_app/view/category_view.dart';
import 'package:shop_app/view/home_screen/4_screens/Setting/settings.dart';
import 'package:shop_app/view/home_screen/4_screens/categories.dart';
import 'package:shop_app/view/home_screen/4_screens/home/home.dart';
import 'package:shop_app/view/home_screen/Home_screen.dart';
import 'package:shop_app/view/onBoarding_screen.dart';
import 'view/home_screen/4_screens/Setting/update_profile.dart';

void main() async{
  //await Memory.init();
  runApp(MyApp());
}


class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
   bool loggedIn = false;

  void loggedOrNot()
   {
     if(Memory.sharedPreferences!.getString('token')!.isEmpty)
      {
        loggedIn = false;
        log('null');
      }
    else
      {
        loggedIn = true;
      }
    log('$loggedIn');
  }

  @override
  void initState() {
    super.initState();
    // Memory.init();
    //loggedOrNot();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
            titleTextStyle: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
            actionsIconTheme: IconThemeData(
              color: Colors.black,
            )
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
          actionsIconTheme: IconThemeData(
            color: Colors.white,
          )
        ),
      ),
      debugShowCheckedModeBanner: false,
      //home: loggedIn? Home() : Login()
      home: Login(),
    );
  }
}
