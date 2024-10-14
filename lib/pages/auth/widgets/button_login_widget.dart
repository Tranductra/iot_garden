import 'package:flutter/material.dart';

import '../../../shared/constants/app_constants.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/constants/styles.dart';

class ButtonLoginWidget extends StatelessWidget {
  const ButtonLoginWidget(
      {super.key, required this.title, required this.onPressed, this.color});
  final String title;
  final Function onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHeight(context) * 0.06,
      width: double.infinity,
      decoration: BoxDecoration(
        color: color ?? primaryBlue,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent),
        onPressed: () {
          onPressed();
        },
        child: Text(
          title,
          style: styleS16W5(Colors.white),
        ),
      ),
    );
  }
}
