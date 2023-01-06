import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zoom_clone/resources/auth_methods.dart';

class FirebaseMethods {
  Stream<QuerySnapshot<Map<String, dynamic>>> get meetingstream =>
      _firebaseFirestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('Meetings')
          .snapshots();
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  void addToMeetingHistory(String meetingName) async {
    try {
      _firebaseFirestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('Meetings')
          .add({'meetingname': meetingName, 'createdAt': DateTime.now()});
    } catch (e) {
      print(e);
    }
  }
}
