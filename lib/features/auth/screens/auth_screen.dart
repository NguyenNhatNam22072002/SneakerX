import 'package:amazon_clone_tutorial/common/widgets/custom_button.dart';
import 'package:amazon_clone_tutorial/common/widgets/custom_textfield.dart';
import 'package:amazon_clone_tutorial/constants/global_variables.dart';
import 'package:amazon_clone_tutorial/constants/utils.dart';
import 'package:amazon_clone_tutorial/features/auth/screens/signup.dart';
import 'package:amazon_clone_tutorial/features/auth/services/auth_service.dart';
import 'package:animated_switch/animated_switch.dart';
import 'package:flutter/material.dart';

enum Auth {
  signin,
  signup,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  final _signInFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  void signInUser() {
    authService.signInUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundColor,
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
              key: _signInFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Login',style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,

                  ),),
                  SizedBox(height: 30,),
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
                    text: 'Sign In',
                    onTap: () {
                      if (_signInFormKey.currentState!.validate()) {
                        print("object");
                        signInUser();
                      } else {
                        showSnackBar(context, 'Error');
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
                        Text("Don't have an account?",style: TextStyle(
                          color: Colors.grey,
                        ),),
                        InkWell(
                          onTap: () {
                            // Điều hướng đến trang signup() ở đây
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => SignUpScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Signup",
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),

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

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: GlobalVariables.greyBackgroundColor,
  //     body: SafeArea(
  //       child: Padding(
  //         padding: const EdgeInsets.all(8.0),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             const Text(
  //               'Welcome',
  //               style: TextStyle(
  //                 fontSize: 22,
  //                 fontWeight: FontWeight.w500,
  //               ),
  //             ),
  //             ListTile(
  //               tileColor: _auth == Auth.signup
  //                   ? GlobalVariables.backgroundColor
  //                   : GlobalVariables.greyBackgroundColor,
  //               title: const Text(
  //                 'Create Account',
  //                 style: TextStyle(
  //                   fontWeight: FontWeight.bold,
  //                 ),
  //               ),
  //               leading: Radio(
  //                 activeColor: GlobalVariables.secondaryColor,
  //                 value: Auth.signup,
  //                 groupValue: _auth,
  //                 onChanged: (Auth? val) {
  //                   setState(() {
  //                     _auth = val!;
  //                   });
  //                 },
  //               ),
  //             ),
  //             if (_auth == Auth.signup)
  //               Container(
  //                 padding: const EdgeInsets.all(8),
  //                 color: GlobalVariables.backgroundColor,
  //                 child: Form(
  //                   key: _signUpFormKey,
  //                   child: Column(
  //                     children: [
  //                       CustomTextField(
  //                         controller: _nameController,
  //                         hintText: 'Name',
  //                       ),
  //                       const SizedBox(height: 10),
  //                       CustomTextField(
  //                         controller: _emailController,
  //                         hintText: 'Email',
  //                       ),
  //                       const SizedBox(height: 10),
  //                       CustomTextField(
  //                         controller: _passwordController,
  //                         hintText: 'Password',
  //                       ),
  //                       const SizedBox(height: 10),
  //                       CustomButton(
  //                         text: 'Sign Up',
  //                         onTap: () {
  //                           if (_signUpFormKey.currentState!.validate()) {
  //                             signUpUser();
  //                           }
  //                         },
  //                       )
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //             ListTile(
  //               tileColor: _auth == Auth.signin
  //                   ? GlobalVariables.backgroundColor
  //                   : GlobalVariables.greyBackgroundColor,
  //               title: const Text(
  //                 'Sign-In.',
  //                 style: TextStyle(
  //                   fontWeight: FontWeight.bold,
  //                 ),
  //               ),
  //               leading: Radio(
  //                 activeColor: GlobalVariables.secondaryColor,
  //                 value: Auth.signin,
  //                 groupValue: _auth,
  //                 onChanged: (Auth? val) {
  //                   setState(() {
  //                     _auth = val!;
  //                   });
  //                 },
  //               ),
  //             ),
  //             if (_auth == Auth.signin)
  //               Container(
  //                 padding: const EdgeInsets.all(8),
  //                 color: GlobalVariables.backgroundColor,
  //                 child: Form(
  //                   key: _signInFormKey,
  //                   child: Column(
  //                     children: [
  //                       CustomTextField(
  //                         controller: _emailController,
  //                         hintText: 'Email',
  //                       ),
  //                       const SizedBox(height: 10),
  //                       CustomTextField(
  //                         controller: _passwordController,
  //                         hintText: 'Password',
  //                       ),
  //                       const SizedBox(height: 10),
  //                       CustomButton(
  //                         text: 'Sign In',
  //                         onTap: () {
  //                           if (_signInFormKey.currentState!.validate()) {
  //                             signInUser();
  //                           }
  //                         },
  //                       )
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }


}
