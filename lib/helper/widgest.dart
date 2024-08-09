import 'package:crystal_test/helper/helper.dart';
import 'package:crystal_test/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomeSpacer extends StatelessWidget {
  double? horizontal;
  double? vertical;
  CustomeSpacer({super.key, this.vertical, this.horizontal});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: vertical != null ? Helper.h(context) * vertical! : 0,
      width: horizontal != null ? Helper.w(context) * horizontal! : 0,
    );
  }
}


 appTextstyle({double? size, FontWeight? fontWeight,double? letterSpacing,Color? color}) {
  return TextStyle(
      color:color?? ColorResource.black,
    
      fontWeight: fontWeight,
      fontSize: size,
      letterSpacing: letterSpacing);
}
