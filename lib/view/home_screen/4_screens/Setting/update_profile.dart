import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shop_app/API/Repository.dart';
import 'package:shop_app/API/models/Login_model.dart';
import 'package:shop_app/Login_Registration_screens/Register_tests/Registration_model.dart';
import 'package:shop_app/Login_Registration_screens/login_screen.dart';
import 'package:shop_app/view/home_screen/4_screens/Setting/settings.dart';
import 'package:shop_app/view/home_screen/Home_screen.dart';

class Update extends StatefulWidget {


  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  var formKey = GlobalKey<FormState>();

  var nameCont = TextEditingController();

  var emailCont = TextEditingController();

  var passCont = TextEditingController();

  var phoneCont = TextEditingController();

  bool loginLoading = false;

  ResponseModel? response;

  Repo repo = Repo();

  Future<void> register()async
  {
    response = await repo.updateInfo(
      token: allData?.data['token'],
      name: nameCont.text,
      email: emailCont.text,
      password: passCont.text,
      phone: phoneCont.text,
    ).then((newModel)
    {
      log('${newModel.data['name']}');
    }).catchError((error)
    {
      log('errorrrr : ${error.toString()}');
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameCont.text = allData?.data['name'];
    emailCont.text = allData?.data['email'];
    phoneCont.text = allData?.data['phone'];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
          Navigator.pop(context);
         }, icon: const Icon(Icons.arrow_back,color: Colors.black,),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Update your info',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 40,
                  ),
                ),
                const SizedBox(height: 5,),
                const SizedBox(
                  height: 20,
                ),

                RegModel(icon: Icons.text_decrease, labelText: 'Name',fieldCont: nameCont),
                const SizedBox(height: 16,),
                RegModel(icon: Icons.email, labelText: 'E-mail',keyboardType: TextInputType.emailAddress,fieldCont: emailCont),
                const SizedBox(height: 16,),
                RegModel(icon: Icons.lock, labelText: 'Password',fieldCont: passCont),
                const SizedBox(height: 16,),
                RegModel(icon: Icons.phone_android, labelText: 'Phone Number',keyboardType: TextInputType.phone,fieldCont: phoneCont ),
                const SizedBox(height: 16,),

                if(loginLoading == true)
                  const CircularProgressIndicator(),
                if(loginLoading == false)
                  OutlinedButton(
                    onPressed: ()async
                    {
                      loginLoading = true;
                      if(formKey.currentState!.validate())
                      {
                        await register().then((value)
                        {
                          setState(() {
                            loginLoading = false;
                          });
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ), (route) => false
                          );
                        });
                      }
                    },
                    child: const Text(
                      'Submit',
                      style:  TextStyle(
                          color: Colors.white
                      ),),
                    style: OutlinedButton.styleFrom(
                        fixedSize: Size(
                          MediaQuery.of(context).size.width/3, 30,
                        ),
                        backgroundColor: Colors.deepOrange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        )
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
