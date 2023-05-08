import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shop_app/API/Repository.dart';
import 'package:shop_app/API/models/Login_model.dart';
import 'package:shop_app/Login_Registration_screens/Register_tests/Registration_model.dart';
import 'package:shop_app/Login_Registration_screens/login_screen.dart';

class Registeration extends StatefulWidget {
  @override
  State<Registeration> createState() => _RegisterationState();
}

class _RegisterationState extends State<Registeration> {
  // Registeration({Key? key}) : super(key: key);
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
    response = await repo.register(
      name: nameCont.text,
      email: emailCont.text,
      password: passCont.text,
      phone: phoneCont.text,
    ).then((newAccount)
    {
      log('${newAccount.data['email']}');
    }).catchError((error)
    {
      log('errorrrr : ${error.toString()}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Register',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 40,
                  ),
                ),
                const SizedBox(height: 5,),
                const Text('Register now to browse your offers',style:  TextStyle(
                    fontSize: 20,
                    color: Colors.grey
                ),),
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
                              builder: (context) => const Login(),
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
