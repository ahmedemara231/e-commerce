
import 'package:flutter/material.dart';
import 'package:shop_app/Login_Registration_screens/login_screen.dart';
import 'package:shop_app/shared_prefs/shared_prefs.dart';
import 'package:shop_app/view/pageView_model.dart';

var cont = PageController();
List<Model> models =
[
  Model(image: 'images/Screenshot (57).png', title: 'On board 1 Title', body: 'On board 1 Body'),
  Model(image: 'images/Screenshot (59).png', title: 'On board 2 Title', body: 'On board 2 Body'),
  Model(image: 'images/Screenshot (57).png', title: 'On board 3 Title', body: 'On board 3 Body'),
];
bool isLast = false ;

class OnBoarding extends StatefulWidget {
  OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Welcome', style: TextStyle(
          color: Colors.deepOrange
        ),),
        actions: [
          TextButton(
              onPressed: () async
              {
                Navigator.pushAndRemoveUntil(
                    context, MaterialPageRoute(
                  builder: (context) => Login(),
                ), (lastPages) => false);
              }, child: const Text(
            'skip',
            style: TextStyle(
            color: Colors.deepOrange
          ),),
          )
        ]

      ),
      body: PageView.builder(
        onPageChanged: (index)
        {
          if(index == models.length - 1)
          {
            setState(() {
              isLast = true;
            });
            print('last');
          }else
          {
            setState(() {
              isLast = false;
            });
            print('not last / index : ${index + 1}');
          }
        },
        physics: const BouncingScrollPhysics(),
        controller: cont,
        itemBuilder: (context, index) => models[index],
        itemCount: models.length,
      ),
    );
  }
}
