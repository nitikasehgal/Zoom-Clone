import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:zoom_clone/resources/firebase_methods.dart';

class HistoryMeetingScreen extends StatefulWidget {
  const HistoryMeetingScreen({super.key});

  @override
  State<HistoryMeetingScreen> createState() => _HistoryMeetingScreenState();
}

class _HistoryMeetingScreenState extends State<HistoryMeetingScreen> {
  FirebaseMethods _firebaseMethods = FirebaseMethods();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasData) {
          return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    "Room Name:- ${(snapshot.data! as dynamic).docs[index]['meetingname']}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "Joined On:- ${DateFormat.yMMMd().format((snapshot.data! as dynamic).docs[index]['createdAt'].toDate())} ",
                    style: TextStyle(fontSize: 16),
                  ),
                );
              },
              itemCount: snapshot.data!.docs.length);
        } else {
          return Center(
            child: Container(
              child: Text(
                "No meetings yet!",
                style: TextStyle(color: Colors.grey, fontSize: 24),
              ),
            ),
          );
        }
      },
      stream: _firebaseMethods.meetingstream,
    );
  }
}
