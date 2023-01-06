import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:zoom_clone/utils/utils.dart';

class Meeting_Option extends StatelessWidget {
  final text;
  final bool isMute;
  final Function(bool) ischange;

  const Meeting_Option(
      {super.key,
      required this.text,
      required this.isMute,
      required this.ischange});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        color: secondaryBackgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text,
                style: TextStyle(fontSize: 16),
              ),
            ),
            Switch.adaptive(value: isMute, onChanged: ischange),
          ],
        ));
  }
}
