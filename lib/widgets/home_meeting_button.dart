import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:zoom_clone/utils/utils.dart';

class HomeMeetingButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String text;
  HomeMeetingButton(this.onPressed, this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(children: [
        Container(
          width: 60,
          height: 60,
          child: Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
          decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                    blurRadius: 10,
                    color: Colors.black.withOpacity(0.06),
                    offset: Offset(0, 4))
              ]),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: TextStyle(color: Colors.grey),
        )
      ]),
    );
  }
}
