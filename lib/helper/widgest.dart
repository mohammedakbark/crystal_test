import 'package:crystal_test/helper/helper.dart';
import 'package:crystal_test/utils/colors.dart';
import 'package:crystal_test/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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

appTextstyle(
    {double? size,
    FontWeight? fontWeight,
    double? letterSpacing,
    Color? color}) {
  return TextStyle(
      color: color ?? ColorResource.black,
      fontWeight: fontWeight,
      fontSize: size,
      letterSpacing: letterSpacing);
}

Widget drawer(BuildContext context) {
  return Drawer(
    elevation: 0,
    shape: const ContinuousRectangleBorder(),
    backgroundColor: ColorResource.white,
    child: ListView(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_rounded)),
        ),
        Center(
          child: Image.asset(
            Images.logo,
            scale: 1.5,
          ),
        ),
        CustomeSpacer(
          vertical: .05,
        ),
        customTile('Home'),
        customTile('About us'),
        customTile('Oir Tariff'),
        customTile('Constact us'),
        customTile('Privacy Policy'),
        customTile('Cancellation Policy'),
        customTile('Refund Policy'),
        customTile('Terms & Condition'),
        customTile('Logout'),
      ],
    ),
  );
}

Widget customTile(String title, {void Function()? onTap}) {
  return ListTile(
    onTap: onTap,
    leading: const Icon(Icons.arrow_forward),
    title: Text(
      title,
      style: appTextstyle(fontWeight: FontWeight.bold, size: 18),
    ),
  );
}
