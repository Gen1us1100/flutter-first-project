import 'package:flutter/material.dart';
import '../constants.dart'as constant;
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
        children: [

        ],
      ),
    );
  }
}
