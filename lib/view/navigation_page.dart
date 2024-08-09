import 'package:crystal_test/controller/ui_controller.dart';
import 'package:crystal_test/helper/widgest.dart';
import 'package:crystal_test/utils/colors.dart';
import 'package:crystal_test/utils/images.dart';
import 'package:crystal_test/view/screens/nav_tab/account_screen.dart';
import 'package:crystal_test/view/screens/nav_tab/booking_screen.dart';
import 'package:crystal_test/view/screens/nav_tab/cart_screen.dart';
import 'package:crystal_test/view/screens/nav_tab/home_screen.dart';
import 'package:crystal_test/view/screens/nav_tab/search_screen.dart';
import 'package:crystal_test/view/widgets/app_bar.dart';
import 'package:crystal_test/view/widgets/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavigationPage extends StatelessWidget {
  NavigationPage({super.key});
  List<Widget> screens = [
    HomeScreen(),
    const SearchScreen(),
    const CartScreen(),
    const BookingScreen(),
    AccountScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: drawer(context),
        appBar: customeAppBar(),
        body: Consumer<UiController>(builder: (context, uiController, _) {
          return screens[uiController.currentIndex];
        }),
        bottomNavigationBar: const CustomNavBar());
  }
}
