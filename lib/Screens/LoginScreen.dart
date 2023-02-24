import 'package:flutter/material.dart';
import '../constants.dart'as constant;
import '../Components/textfield.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: constant.primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Container()),
          Expanded(
            child: Image.network('https://ps.w.org/login-customizer/assets/icon-256x256.png?rev=2455454',
            ),
          ),
          textfield(text: "E-mail",isPassword: false),
          textfield(text: 'Password',isPassword: true),
          ClipRRect(
            borderRadius: BorderRadius.circular(25.0),
            child: Container(
              width: 100,
              height: 50,
              color: constant.hinttextColor,
              child: TextButton(
                  style:TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      side: BorderSide(
                        width: 2,
                        color: constant.primaryColor,
                      )
                    )
                  ),
                  onPressed: (){}, child: Text('Login',
              style: TextStyle(
                fontSize: 30,
                color: constant.primaryColor

                  ),
                )
              ),
            ),
          ),
          Expanded(
              child: Container()),
        ],
      ),
    );
  }
}
