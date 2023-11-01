import 'package:amazon_clone_tutorial/common/widgets/custom_button.dart';
import 'package:amazon_clone_tutorial/common/widgets/custom_textfield.dart';
import 'package:amazon_clone_tutorial/constants/utils.dart';
import 'package:amazon_clone_tutorial/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone_tutorial/features/auth/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:animated_switch/animated_switch.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = '/signup-screen';
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  final _signUpFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _confirmPasswordController.dispose();
  }

  void signUpUser() {
    authService.signUpUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
      name: _nameController.text,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Image(
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              image: AssetImage('assets/images/splashimg.png')),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Colors.black,
                      Colors.black.withOpacity(0.8),
                      Colors.black.withOpacity(0.15),
                      Colors.black.withOpacity(0.5),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter
                )
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Form(
              key: _signUpFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('SignUp',style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,

                  ),),
                  SizedBox(height: 30,),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: CustomTextField(
                      controller: _nameController,
                      hintText: 'User Name',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: CustomTextField(
                      controller: _emailController,
                      hintText: 'Email Address',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: CustomTextField(
                      controller: _passwordController,
                      hintText: 'Password',
                      obscureText: true,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: CustomTextField(
                      controller: _confirmPasswordController,
                      hintText: 'Confirm Password',
                      obscureText: true,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 19,top: 8,right: 19),
                    child: Row(
                      children: [
                        AnimatedSwitch(
                          colorOff: Color(0xffA09F99),
                        ),
                        SizedBox(width: 5,),
                        Text('Remember me',style: TextStyle(
                          color: Colors.grey,
                        ),),
                        Spacer(),
                        Text("Forgot Password",style: TextStyle(
                          color: Colors.grey,
                        ),),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  CustomButton(
                    text: 'Sign up',
                    onTap: () {
                      if (_passwordController.text == _confirmPasswordController.text) {
                        if (_signUpFormKey.currentState!.validate()) {
                          signUpUser();
                        }
                      }
                      else {
                        showSnackBar(context, 'Passwords do not match');
                      }

                    },
                  ),
                  SizedBox(height: 15,),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 18.0,right: 18),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //     children: [
                  //       Text('-----------',style: TextStyle(color: Colors.white,fontSize: 30),),
                  //       Text('Or Login With',style: TextStyle(color: Colors.white,),),
                  //       Text('-----------',style: TextStyle(color: Colors.white,fontSize: 30),),
                  //     ],
                  //   ),
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     Container(
                  //       height: 50,
                  //       width: 100,
                  //       decoration: BoxDecoration(
                  //           color: Color(0xff484848),
                  //           borderRadius: BorderRadius.circular(5)
                  //       ),
                  //       child: Icon(Icons.g_mobiledata,color: Colors.white,size: 40,),
                  //     ),
                  //     Container(
                  //       height: 50,
                  //       width: 100,
                  //       decoration: BoxDecoration(
                  //           color: Color(0xff484848),
                  //           borderRadius: BorderRadius.circular(5)
                  //       ),
                  //       child: Icon(Icons.apple,color: Colors.white,size: 40,),
                  //     ),
                  //     Container(
                  //       height: 50,
                  //       width: 100,
                  //       decoration: BoxDecoration(
                  //           color: Color(0xff484848),
                  //           borderRadius: BorderRadius.circular(5)
                  //       ),
                  //       child: Icon(Icons.facebook,color: Colors.white,size: 40,),
                  //     ),
                  //   ],
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(left: 100.0,top: 30),
                    child: Row(
                      children: [
                        Text("Alredy have an accont?",style: TextStyle(
                          color: Colors.grey,
                        ),),
                        SizedBox(width: 5,),
                        InkWell(
                          onTap: () {
                            // Thực hiện điều gì đó khi người dùng nhấn vào "Login"
                            // Ví dụ: Chuyển sang trang khác
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => AuthScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        )

                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
