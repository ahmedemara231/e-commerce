import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class Memory
{
  static SharedPreferences? sharedPreferences;

  static void init() async
  {
    sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences == null)
      {
        log('null');
      }
    else{
      log('not null');
    }
  }
}