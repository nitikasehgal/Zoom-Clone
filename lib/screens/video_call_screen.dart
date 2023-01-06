import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:zoom_clone/resources/auth_methods.dart';
import 'package:zoom_clone/resources/jitsi_meet_methods.dart';
import 'package:zoom_clone/utils/utils.dart';
import 'package:zoom_clone/widgets/meeting_option.dart';

class VideoCallScreen extends StatefulWidget {
  static const routeName = '/videocall';

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  final AuthMethods _authMethods = AuthMethods();
  late TextEditingController meetingIdcontroller;
  late TextEditingController namecontroller;
  bool isAudioMuted = true;
  bool isVideoMuted = true;
  JitsiMethods _jitsiMethods = JitsiMethods();

  @override
  void initState() {
    meetingIdcontroller = TextEditingController();
    namecontroller = TextEditingController(text: _authMethods.user.displayName);
    super.initState();
  }

  _joinMeeting() async {
    _jitsiMethods.createMeeting(
        roomName: meetingIdcontroller.text,
        isAudioMuted: isAudioMuted,
        isVideoMuted: isVideoMuted,
        username: namecontroller.text);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    meetingIdcontroller.dispose();

    namecontroller.dispose();

    JitsiMeet.removeAllListeners();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        centerTitle: true,
        title: Text(
          "Join a meeting",
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: Column(children: [
        SizedBox(
          height: 60,
          child: TextField(
            controller: meetingIdcontroller,
            maxLines: 1,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                fillColor: secondaryBackgroundColor,
                filled: true,
                border: InputBorder.none,
                hintText: "Room Id",
                contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0)),
          ),
        ),
        SizedBox(
          height: 60,
          child: TextField(
            controller: namecontroller,
            maxLines: 1,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                fillColor: secondaryBackgroundColor,
                filled: true,
                border: InputBorder.none,
                hintText: "Name",
                contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0)),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: _joinMeeting,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Join Meeting",
              style: TextStyle(
                  fontSize: 20,
                  color: buttonColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Meeting_Option(
          text: "Mute Audio",
          isMute: isAudioMuted,
          ischange: onAudioMuted,
        ),
        Meeting_Option(
          text: "Turn off my Video",
          isMute: isVideoMuted,
          ischange: onVideoMuted,
        )
      ]),
    );
  }

  onAudioMuted(bool? val) {
    setState(() {
      isAudioMuted = val!;
    });
  }

  onVideoMuted(bool? val) {
    setState(() {
      isVideoMuted = val!;
    });
  }
}
