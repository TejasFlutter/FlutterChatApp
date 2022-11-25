import 'package:flutter/material.dart';
import 'package:my_chat_app/constant/constant.dart';
import 'package:my_chat_app/services/auth.dart';
import 'package:my_chat_app/services/database_methods.dart';
import 'package:my_chat_app/widget/widget.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var _globalSignupFormKey = GlobalKey<FormState>();
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();
  var _usernameController = TextEditingController();
  var _isLoading = false;
  var authService = AuthService();
  var _databaseMethods = DatabaseMethods();
  var email = 'w@gmail.com';
  var password = '111111111';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: SingleChildScrollView(
        child: Form(
          key: _globalSignupFormKey,
          child: Padding(
            padding: const EdgeInsets.all(26.0),
            child: Column(
              children: [
                TextFormField(
                  controller: _usernameController,
                  decoration: textfieldInputDecoration('Please enter username'),
                  style: textfieldHintStyle(),
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Please fill field';
                    } else {
                      return null;
                    }
                  },
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: textfieldInputDecoration('Please enter email'),
                  style: textfieldHintStyle(),
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'please fill field';
                    } else if (!emailValidateExpression.hasMatch(val)) {
                      return 'please enter correct email';
                    } else {
                      return null;
                    }
                  },
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'please enter password';
                    } else {
                      return null;
                    }
                  },
                  style: textfieldHintStyle(),
                  decoration: textfieldInputDecoration('please enter password'),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: double.maxFinite,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        //_isLoading = true;
                        email = _emailController.text;
                        password = _passwordController.text;
                      });
                      print(email);
                      signUp();
                    },
                    child: Text('Sign up'),
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
      backgroundColor: Colors.black,
    );
  }
// Error:
// statically data inserted
// my mean is if we specify email insted of _emailController 
// it works
  signUp() async {
    if (_globalSignupFormKey.currentState!.validate()) {
      await authService.signUpWithEmailAndPassword(
        _emailController.text,
        'password',
      );
      // .then((value) {
      //print(_emailController.text);
      //print(_passwordController.text);
      // if (value != null) {
      //   Map<String, String> userMap = {
      //     'userName': _usernameController.text.toString(),
      //     'userEmail': _emailController.text.toString()
      //   };
      //   print('$userMap');

      //  await _databaseMethods.addUserInfo(userMap);
      // }
      //}
      //);'

    }
  }
}
