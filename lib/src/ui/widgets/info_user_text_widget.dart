import 'package:flutter/material.dart';

import '../colors/colors.dart';
import '../responsive/Adapt.dart';

class InfoUserText extends StatelessWidget {
  final String text;
  const InfoUserText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Adapt.hp(3),
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: TextStyle(fontSize: Adapt.px(25), color: ColorsApp.appColor),
      ),
    );
  }
}
