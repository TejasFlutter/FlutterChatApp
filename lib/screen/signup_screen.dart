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
  var _authService = AuthService();
  var _databaseMethods = DatabaseMethods();
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
                    // emailValidateExpression.hasMatch(val!)
                    //     ? null
                    //     : 'Please enter correct email';
                    if (val == null || val.isEmpty) {
                      return 'Please enter email';
                    } else {
                      return null;
                    }
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

  signUp() async {
    if (_globalSignupFormKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await _authService
          .signUpWithEmailAndPassword(
        'iamtejasb@gmail.com',
        '12345678',
      )
          .then((value) {
        print(_emailController.text);
        print(_passwordController.text);
        if (value != null) {
          Map<String, String> userMap = {
            'username': 'Tejas',
            'email': 'a@gmail.com'
          };
          print('$userMap');

          _databaseMethods.addUserInfo(userMap);
        }
      });
    }
  }
}
