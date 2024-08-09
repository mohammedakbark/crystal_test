import 'package:crystal_test/helper/widgest.dart';
import 'package:crystal_test/utils/colors.dart';
import 'package:crystal_test/utils/const_var.dart';
import 'package:crystal_test/utils/images.dart';
import 'package:crystal_test/view/widgets/custome_button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

PreferredSizeWidget customeAppBar() {
  return AppBar(
    leading: Builder(builder: (context) {
      return IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: Image.asset(
            Images.drawerIcon,
            scale: 25,
          ));
    }),
    actions: [
      CustomeButton(
        bgColor: ColorResource.appThemeYello,
        onPressed: () async {
          await launch('tel:+91 ${ConstVar.contactNumber}');
        },
        radius: 30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Icon(
              Icons.wifi_calling_3_outlined,
              color: ColorResource.black,
            ),
            CustomeSpacer(
              horizontal: .01,
            ),
            Text(
              '+91 - ${ConstVar.contactNumber}',
              style: appTextstyle(fontWeight: FontWeight.w900),
            )
          ],
        ),
      ),
      CustomeSpacer(
        horizontal: .1,
      ),
    ],
  );
}
