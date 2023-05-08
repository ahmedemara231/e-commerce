import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shop_app/Login_Registration_screens/login_screen.dart';
import 'package:shop_app/shared_prefs/shared_prefs.dart';

class Logout extends StatelessWidget {
  const Logout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: ()
            {
              Navigator.pop(context);
            }, icon: const Icon(Icons.arrow_back, color: Colors.black,)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text('Logout from ',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                 ),
                ),
                Text('${allData?.data['email']}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.blue
                  ),
                ),
                const Text(' ?',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              color: Colors.blue,
              child: MaterialButton(
                onPressed: ()
                {
                  showDialog(context: context, builder: (context) => AlertDialog(
                    title: const Text('Are you sure to log out ? '),
                    actions: [
                      TextButton(
                          onPressed: ()
                          {
                            Navigator.pop(context);
                          }, child: const Text('Cancel')),
                      const SizedBox(
                        width: 14,
                      ),
                      TextButton(
                          onPressed: ()
                          {
                            Memory.sharedPreferences?.remove('token').then((value)
                            {
                              Navigator.pop(context);
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(builder: (context) => Login(),
                                  ), (route) => false
                              );
                              log('logged out successfully');
                            });
                          }, child: const Text('Log out')),
                    ],
                  ),);
                },
                child: const Text('Log out'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
