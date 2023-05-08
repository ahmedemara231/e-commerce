import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shop_app/API/Repository.dart';
import 'package:shop_app/API/models/Login_model.dart';
import 'package:shop_app/Login_Registration_screens/Register_tests/registeration_screen.dart';
import 'package:shop_app/shared_prefs/shared_prefs.dart';
import 'package:shop_app/view/home_screen/Home_screen.dart';

ResponseModel? allData;
class Login extends StatefulWidget {
   const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isVisible = false;
  bool loginLoading = false;
  var formKey = GlobalKey<FormState>();
  var emailCont = TextEditingController();
  var passCont = TextEditingController();
  late String token;
  Repo repo = Repo();

  Future<void> getResponse()async
  {
    allData = await repo.postData(email: emailCont.text, password: passCont.text);
    if(allData?.status == true)
    {
      log('ahmed');
    }
    else if(allData?.status == false)
      {
        log('false');
      }
    else{
      log('حسبى الله');
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Memory.init();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('LOGIN',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50
                  ),),
                  const Text('Login now to browse your offers',style:  TextStyle(
                    fontSize: 20,
                    color: Colors.grey
                  ),),
                  const SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    controller: emailCont ,
                    validator: (email)
                    {
                      if(email!.isEmpty)
                        {
                          return ' please enter your email';
                        }
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email_outlined),
                      labelText: 'Email Address'
                  ),),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: passCont,
                    validator: (password)
                    {
                      if(password!.isEmpty)
                      {
                        return ' please enter your password';
                      }
                    },
                    //keyboardType: TextInputType,
                    decoration:  InputDecoration(
                        border: const OutlineInputBorder(),
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                            onPressed: ()
                            {
                              setState(() {
                                isVisible = !isVisible;
                              });
                            },
                            icon: isVisible?  const Icon(Icons.visibility_off) : const Icon(Icons.remove_red_eye),
                        ),
                        labelText: 'Password'
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      if(loginLoading == true)
                        const CircularProgressIndicator(),
                      if(loginLoading == false)
                        OutlinedButton(
                          onPressed: () async
                          {
                            loginLoading = true;
                            if(formKey.currentState!.validate())
                            {
                               getResponse().then((value)
                              {
                                setState(() {
                                  loginLoading = false;
                                });
                                if(allData?.status == true)
                                  {
                                    log('${allData?.status} / Logged in successfully');
                                    log('${allData?.data['email']}');

                                    // saving token to manage app
                                    Memory.sharedPreferences?.setString('token', allData?.data['token']);
                                   token = Memory.sharedPreferences!.getString('token')!;
                                   log(token);

                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HomeScreen(name: allData?.data['name']),
                                      ), (route) => false,
                                    );
                                  }
                                else
                                  {
                                    log('Wrong');
                                    setState(() {
                                      // showDialog(
                                      //   context: context,
                                      //   builder: (context) => AlertDialog(
                                      //     backgroundColor: Colors.white,
                                      //     actions: [
                                      //       TextButton(
                                      //           onPressed: ()
                                      //           {
                                      //             Navigator.pop(context);
                                      //           }, child: const Text('OK')
                                      //       ),
                                      //     ],
                                      //     title: const Text('Your Email Address or password was wrong please try again'),
                                      //   ),
                                      // );
                                    });
                                  }

                              });
                            }
                            else
                            {
                              log('NO');
                            }

                          },
                          child: const Text(
                            'LOGIN',
                            style: TextStyle(
                                color: Colors.white
                            ),),
                          style: OutlinedButton.styleFrom(
                              fixedSize: Size(
                                  MediaQuery.of(context).size.width/3,
                                  30),
                              backgroundColor: Colors.deepOrange,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              )
                          ),
                        ),
                      const Spacer(),
                      const Text('Don\'t have an account ?'),
                      TextButton(
                          onPressed: ()
                          {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Registeration(),
                                ),
                            );
                          },
                          child: const Text(
                            'REGISTER',
                            style: TextStyle(
                        color: Colors.deepOrange
                      ),
                          ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
