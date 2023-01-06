import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:zoom_clone/resources/auth_methods.dart';
import 'package:zoom_clone/screens/history_meeting_screen.dart';
import 'package:zoom_clone/screens/meeting_screen.dart';
import 'package:zoom_clone/utils/utils.dart';
import 'package:zoom_clone/widgets/home_meeting_button.dart';
import 'package:zoom_clone/widgets/signin_button.dart';

class HomeScreen extends StatefulWidget {
  static const routename = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AuthMethods _authMethods = AuthMethods();
  int _page = 0;
  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [
    MeetingScreen(),
    HistoryMeetingScreen(),
    Center(child: const Text("Contacts")),
    SettingsPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Meet & Chat",
        ),
        centerTitle: true,
        backgroundColor: backgroundColor,
      ),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: footerColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          onTap: onPageChanged,
          currentIndex: _page,
          unselectedFontSize: 14,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.comment_bank),
              label: "Meet & Chat",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.lock_clock),
              label: "Meetings",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: "Contacts",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: "Settings",
            ),
          ]),
    );
  }
}

class SettingsPage extends StatelessWidget {
  AuthMethods _authMethods = AuthMethods();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        _authMethods.signOut();
      },
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
              color: buttonColor, borderRadius: BorderRadius.circular(30)),
          width: double.infinity,
          height: 50,
          alignment: Alignment.center,
          child: Text(
            "Log Out",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 19),
          )),
    );
  }
}
