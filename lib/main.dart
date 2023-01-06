import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zoom_clone/screens/home_Screen.dart';
import 'package:zoom_clone/screens/login_Screen.dart';
import 'package:zoom_clone/screens/video_call_screen.dart';
import 'package:zoom_clone/utils/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ZoomApp());
}

class ZoomApp extends StatelessWidget {
  const ZoomApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Zoom App",
      theme:
          ThemeData.dark().copyWith(scaffoldBackgroundColor: backgroundColor),
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            return HomeScreen();
          } else {
            return LoginScreen();
          }
        },
      ),
      routes: {
        LoginScreen.routeName: (context) => LoginScreen(),
        HomeScreen.routename: (context) => HomeScreen(),
        VideoCallScreen.routeName: (context) => VideoCallScreen()
      },
    );
  }
}
