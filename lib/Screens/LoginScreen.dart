import 'package:flutter/material.dart';
import 'package:untitled/Network/Location.dart';
import '../constants.dart'as constant;
import '../Components/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';


import 'MainScreen.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String email,password;
  int myvar = 0;

  @override
  void initState(){
    super.initState();
    apiCall();
  }
  void apiCall() async {
    var location = await determinePosition();
    myvar = await constant.apiInstance.getLocation(location.latitude.toString(),
        location.longitude.toString());
  }

  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;
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
          textfield(text: "E-mail",
            isPassword: false,
            onchanged: (value){
            email = value;
            },
          ),
          textfield(text: 'Password',
              isPassword: true,
            onchanged: (value){
            password = value;
            },
          ),
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
                  onPressed: () async {
                    try{
                    final newUser =
                      await _auth.signInWithEmailAndPassword(
                      email :email, password: password
                    );
                    if(newUser.user != null && myvar != 0){
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (context)=>MainScreen()));
                    }}
                    catch(e){
                      debugPrint('$e');
                    }
                  }, child: Text('Login',
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
