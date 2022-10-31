import 'package:flutter/material.dart';

import '../responsive/Adapt.dart';

class TittleText extends StatelessWidget {
  const TittleText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(left: Adapt.px(20)),
        child: Text(
          text,
          style: TextStyle(
            fontSize: Adapt.px(30),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
