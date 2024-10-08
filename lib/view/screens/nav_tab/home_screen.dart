import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:crystal_test/controller/ui_controller.dart';
import 'package:crystal_test/helper/helper.dart';
import 'package:crystal_test/helper/widgest.dart';
import 'package:crystal_test/utils/colors.dart';
import 'package:crystal_test/utils/images.dart';
import 'package:crystal_test/view/widgets/screen_margin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenMargin(
        child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomeSpacer(
            vertical: .03,
          ),
          Text(
            'Welcome Anand Jain',
            style: appTextstyle(fontWeight: FontWeight.w600, size: 22),
          ),
          Text(
            'find your ride',
            style: appTextstyle(
                fontWeight: FontWeight.bold,
                size: 22,
                color: ColorResource.grey),
          ),
          CustomeSpacer(
            vertical: .03,
          ),
          AspectRatio(
            aspectRatio: 2 / 1,
            child: CarouselSlider.builder(
              itemCount: UiController.slides.length,
              itemBuilder: (context, index, realIndex) {
                return Container(
                  width: Helper.w(context),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:
                      Image.asset(fit: BoxFit.fill, UiController.slides[index]),
                );
              },
              options: CarouselOptions(
                  aspectRatio: 2 / 1,
                  pageSnapping: false,
                  disableCenter: true,
                  clipBehavior: Clip.antiAlias,
                  autoPlay: true),
            ),
          ),
          CustomeSpacer(
            vertical: .03,
          ),
          Text(
            'Our Fleet',
            style: appTextstyle(fontWeight: FontWeight.w600, size: 22),
          ),
          CustomeSpacer(
            vertical: .02,
          ),
          SizedBox(
            height:
                Helper.h(context) * (UiController.listViewItems.length * .17),
            child: ListView.builder(
              itemCount: UiController.listViewItems.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return _listViewTile(
                    context, UiController.listViewItems[index]);
              },
            ),
          )
        ],
      ),
    ));
  }

  Widget _listViewTile(BuildContext context, Map<String, dynamic> data) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: ColorResource.white,
          border: Border.all(color: ColorResource.appThemeYello),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                blurRadius: 5,
                blurStyle: BlurStyle.normal,
                offset: const Offset(0, 1),
                spreadRadius: 1,
                color: ColorResource.grey.withOpacity(.9))
          ]),
      child: Row(
        children: [
          SizedBox(
            height: 120,
            width: 120,
            child: Image.asset(
              data['image'],
              fit: BoxFit.fill,
            ),
          ),
          CustomeSpacer(
            horizontal: .03,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data['title'],
                style: appTextstyle(size: 18, fontWeight: FontWeight.w900),
              ),
              Text(
                'Start from',
                style: appTextstyle(
                    color: ColorResource.grey, fontWeight: FontWeight.normal),
              ),
              CustomeSpacer(
                vertical: .01,
              ),
              SizedBox(
                width: Helper.w(context) * .5,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Monday - Thursday',
                          style: appTextstyle(fontWeight: FontWeight.w800),
                        ),
                        Text(
                          'Friday - Sunday',
                          style: appTextstyle(fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                    Container(
                      width: 1.5,
                      height: 40,
                      color: ColorResource.black,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '₹ ${data['start']}',
                          style: appTextstyle(fontWeight: FontWeight.w800),
                        ),
                        Text(
                          '₹ ${data['end']}',
                          style: appTextstyle(fontWeight: FontWeight.w800),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
