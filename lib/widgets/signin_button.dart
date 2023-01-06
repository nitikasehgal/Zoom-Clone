import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:zoom_clone/resources/auth_methods.dart';
import 'package:zoom_clone/screens/home_Screen.dart';
import 'package:zoom_clone/utils/utils.dart';

class Custom_button extends StatefulWidget {
  @override
  State<Custom_button> createState() => _Custom_buttonState();
}

class _Custom_buttonState extends State<Custom_button> {
  AuthMethods _authMethods = AuthMethods();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        bool res = await _authMethods.signInwithGoogle(context);
        if (res) {
          Navigator.pushReplacementNamed(context, HomeScreen.routename);
        }
      },
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
              color: buttonColor, borderRadius: BorderRadius.circular(30)),
          width: double.infinity,
          height: 50,
          alignment: Alignment.center,
          child: Text(
            "Google Sign In",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 19),
          )),
    );
  }
}
