import 'package:crystal_test/controller/ui_controller.dart';
import 'package:crystal_test/helper/helper.dart';
import 'package:crystal_test/helper/widgest.dart';
import 'package:crystal_test/utils/colors.dart';
import 'package:crystal_test/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<UiController>(builder: (context, uiController, _) {
      return SizedBox(
        height: Helper.h(context) * .09,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: uiController.onChangeScreen,
          backgroundColor: ColorResource.appThemeYello,
          unselectedItemColor: ColorResource.black,
          currentIndex: uiController.currentIndex,
          selectedItemColor: ColorResource.white,
          unselectedLabelStyle: appTextstyle(fontWeight: FontWeight.w900),
          selectedLabelStyle: appTextstyle(
              size: 14,
              fontWeight: FontWeight.w900,
              color: ColorResource.white),
          items: [
            BottomNavigationBarItem(
                label: 'HOME',
                icon: Image.asset(
                    color: uiController.currentIndex == 0
                        ? ColorResource.white
                        : ColorResource.black,
                    scale: 25,
                    Images.homeIcon)),
            BottomNavigationBarItem(
                label: 'SEARCH',
                icon: Image.asset(
                    color: uiController.currentIndex == 1
                        ? ColorResource.white
                        : ColorResource.black,
                    scale: 25,
                    Images.searchIcon)),
            BottomNavigationBarItem(
                label: 'CART',
                icon: Image.asset(
                    color: uiController.currentIndex == 2
                        ? ColorResource.white
                        : ColorResource.black,
                    scale: 25,
                    Images.cartIcon)),
            BottomNavigationBarItem(
                label: 'BOOKINGS',
                icon: Image.asset(
                    color: uiController.currentIndex == 3
                        ? ColorResource.white
                        : ColorResource.black,
                    scale: 25,
                    Images.bookingIcon)),
            BottomNavigationBarItem(
                label: 'ACCOUNT',
                icon: Image.asset(
                    color: uiController.currentIndex == 4
                        ? ColorResource.white
                        : ColorResource.black,
                    scale: 25,
                    Images.accountIcon))
          ],
        ),
      );
    });
  }
}
