import 'package:crystal_test/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:crystal_test/helper/helper.dart';

class CustomeButton extends StatelessWidget {
  final Widget child;
  void Function()? onPressed;
  Color bgColor;
  Color? textColor;
  double radius;

  CustomeButton(
      {super.key,
      required this.radius,
      required this.bgColor,
      required this.onPressed,
      this.textColor,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1),
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
              backgroundColor: bgColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius)),
              side: const BorderSide(
                width: .5,
                color: ColorResource.white,
              )),
          onPressed: onPressed,
          child: child),
    );
  }
}
