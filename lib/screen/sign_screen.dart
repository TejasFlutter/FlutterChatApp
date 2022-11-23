import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_chat_app/widget/widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  var _globalFormKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  var emailValidateExpression = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _globalFormKey,
            child: Padding(
              padding: const EdgeInsets.all(26.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: _emailController,
                    decoration: textfieldInputDecoration('Please enter name'),
                    style: textfieldHintStyle(),
                    validator: (val) {
                      emailValidateExpression.hasMatch(val!)
                          ? null
                          : 'Please enter correct email';
                    },
                  ),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    validator: (val) {
                      return val!.length > 6
                          ? null
                          : 'Enter Password With morethan 6 character';
                    },
                    style: textfieldHintStyle(),
                    decoration:
                        textfieldInputDecoration('please enter password'),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: double.maxFinite,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Sign in'),
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Container(
                    width: double.maxFinite,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Sign in with google'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        shape: StadiumBorder(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have account? ",
                        style: textfieldHintStyle(),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Register now",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              decoration: TextDecoration.underline),
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
      backgroundColor: Colors.black,
    );
  }
}
