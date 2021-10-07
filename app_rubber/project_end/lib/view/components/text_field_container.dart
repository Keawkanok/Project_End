import 'package:flutter/material.dart';

import '../../constants.dart';

class TextFieldContainrt extends StatelessWidget {
  final Widget child;
  const TextFieldContainrt({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
          color: kPrimaryColor, borderRadius: BorderRadius.circular(29)),
    );
  }
}
