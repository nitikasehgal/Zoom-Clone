import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:zoom_clone/resources/jitsi_meet_methods.dart';
import 'package:zoom_clone/screens/video_call_screen.dart';

import '../widgets/home_meeting_button.dart';

class MeetingScreen extends StatefulWidget {
  const MeetingScreen({super.key});

  @override
  State<MeetingScreen> createState() => _MeetingScreenState();
}

class _MeetingScreenState extends State<MeetingScreen> {
  final JitsiMethods _jitsiMethods = JitsiMethods();
  createNewMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();
    _jitsiMethods.createMeeting(
        roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }

  joinMeeting() async {
    Navigator.pushNamed(context, VideoCallScreen.routeName);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    JitsiMeet.removeAllListeners();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          HomeMeetingButton(
            createNewMeeting,
            Icons.videocam,
            'New Meeting',
          ),
          HomeMeetingButton(
            () => joinMeeting(),
            Icons.add_box_rounded,
            'Join Meeting',
          ),
          HomeMeetingButton(
            () {},
            Icons.calendar_today,
            'Schedule',
          ),
          HomeMeetingButton(
            () {},
            Icons.arrow_upward_rounded,
            'Share Screen',
          ),
        ],
      ),
      Expanded(
        child: Center(
          child: Text(
            "Create/Join Meetings with just a Click",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
      ),
    ]);
  }
}
