import 'package:flutter/material.dart';
import 'package:shop_app/Login_Registration_screens/login_screen.dart';
import 'package:shop_app/view/onBoarding_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Model extends StatelessWidget {

  Model({Key? key,
    required this.image,
    required this.title,
    required this.body,
  });
  String image;
  String title;
  String body;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Image.asset(image)),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const  TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30
                ),),
               const SizedBox(
                  height: 40,
                ),
                Text(
                  body,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20
                  ),),
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: SmoothPageIndicator(
                  count: models.length,
                  controller: cont,
                  effect: const ExpandingDotsEffect(
                    activeDotColor: Colors.deepOrange,
                    dotColor: Colors.grey,

                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: FloatingActionButton(
                  onPressed: ()
                  {
                    if(isLast)
                      {
                        Navigator.pushAndRemoveUntil(
                            context, MaterialPageRoute(
                          builder: (context) => Login(),
                        ), (lastPages) => false);
                      }
                    cont.nextPage(
                        duration: const Duration(
                      microseconds: 750,
                    ), curve: Curves.fastLinearToSlowEaseIn);
                  },
                child: const Icon(Icons.arrow_forward_ios),
                backgroundColor: Colors.deepOrange,
                ),
              ),
            ],
          )
        ],
      );
  }
}
