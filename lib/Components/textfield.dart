import 'package:flutter/material.dart';
import '../constants.dart' as constant;
class textfield extends StatelessWidget {
  final String text;
  final bool isPassword;
  final Function(String) onchanged;

  const textfield({
    super.key,
    required this.text,
    required this.isPassword,
    required this.onchanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextField(
        onChanged: onchanged,
        style: TextStyle(
          color: constant.hinttextColor,
        ),
        obscureText: isPassword,
        decoration: InputDecoration(
            hintText: text,
            hintStyle: TextStyle(
              color: constant.hinttextColor,
              fontSize: 23.0,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: constant.hinttextColor,
                  width: 2,
                  style: BorderStyle.solid,
                )
            )
        ),
      ),
    );
  }
}