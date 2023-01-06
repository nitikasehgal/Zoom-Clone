import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:zoom_clone/widgets/signin_button.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          'Start or join a meeting',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
        ),
        SizedBox(
          height: 40,
        ),
        Image.asset("assets/images/onboarding.jpg"),
        SizedBox(
          height: 50,
        ),
        Custom_button(),
      ]),
    );
  }
}
