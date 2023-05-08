import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shop_app/main.dart';
import 'package:shop_app/view/home_screen/4_screens/Setting/Logout_screen.dart';
import 'package:shop_app/view/home_screen/4_screens/Setting/update_profile.dart';


class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.update,size: 40,),
              title: const Text('Update info',style: TextStyle(
                fontSize: 20,
              ),),
              trailing: IconButton(
                  onPressed: ()
                  {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  Update(),
                        ),);
                  }, icon: const Icon(Icons.arrow_forward_ios)),
            ),
            const SizedBox(
              height: 16,
            ),
            ListTile(
              leading: const Icon(Icons.dark_mode,size: 40,),
              title: const Text(
                'Dark Mode',
                style: TextStyle(
                fontSize: 20,
              ),),
              trailing: IconButton(
                  onPressed: ()
                  {
                    setState(() {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Column(
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Row(
                                  children: const [
                                    Icon(Icons.sunny),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    Text('Light Mode'),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              InkWell(
                                onTap: () {},
                                child: Row(
                                  children: const [
                                    Icon(Icons.dark_mode),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    Text('Dark Mode'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
                  }, icon: const Icon(Icons.arrow_forward_ios)),
            ),
            const SizedBox(
              height: 16,
            ),
            ListTile(
              leading: const Icon(Icons.logout, size: 40,color: Colors.red,),
              title: const Text(
                'Log out',
                style: TextStyle(
                fontSize: 20,color: Colors.red,
              ),
              ),
              trailing: IconButton(
                  onPressed: ()
                  {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Logout(),
                        ),
                    );
                  }, icon: const Icon(Icons.arrow_forward_ios) ),
            ),
          ],
        ),
      )
    );
  }
}
