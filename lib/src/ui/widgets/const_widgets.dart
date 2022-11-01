import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../responsive/Adapt.dart';

class ConstsWidget {
  static final spaceW = Container(
    width: Adapt.wp(5),
  );
  static final spaceH = Container(
    height: Adapt.hp(0.5),
  );
  static Widget emptyListWidget() {
    return Container(
      height: Adapt.hp(40),
      alignment: Alignment.center,
      child: Text(S.current.listEmpty),
    );
  }
}
