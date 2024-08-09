import 'package:crystal_test/controller/enum/order_status.dart';
import 'package:crystal_test/controller/ui_controller.dart';
import 'package:crystal_test/helper/helper.dart';
import 'package:crystal_test/helper/widgest.dart';
import 'package:crystal_test/utils/colors.dart';
import 'package:crystal_test/view/widgets/custome_button.dart';
import 'package:crystal_test/view/widgets/screen_margin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          ScreenMargin(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomeSpacer(
                  vertical: .03,
                ),
                Text(
                  'My Bookings',
                  style: appTextstyle(fontWeight: FontWeight.w600, size: 22),
                ),
                TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorWeight: 3,
                    overlayColor: MaterialStatePropertyAll(
                      ColorResource.appThemeYello.withOpacity(.1),
                    ),
                    indicatorColor: ColorResource.appThemeYello,
                    dividerColor: Colors.transparent,
                    labelStyle: appTextstyle(
                        size: 19,
                        color: ColorResource.black,
                        fontWeight: FontWeight.w600),
                    unselectedLabelStyle: appTextstyle(
                        size: 19,
                        color: ColorResource.grey,
                        fontWeight: FontWeight.w600),
                    tabs: const [
                      Tab(
                        text: 'UpComing',
                      ),
                      Tab(
                        text: 'Completed',
                      )
                    ]),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: ColorResource.grey.withOpacity(.2),
              child: TabBarView(
                children: [_upComingView(), _completed()],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _upComingView() {
    return ScreenMargin(
      child: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) => _listViewTile(
            context, UiController.listViewItems[index], index.isEven),
      ),
    );
  }

  Widget _completed() {
    return ScreenMargin(
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) => _listViewTile(
            orderstatus: Orderstatus.completed,
            context,
            UiController.listViewItems[index],
            index.isEven),
      ),
    );
  }

  Widget _listViewTile(
      BuildContext context, Map<String, dynamic> data, bool isEven,
      {Orderstatus? orderstatus}) {
    return Container(
      constraints: const BoxConstraints(),
      margin: const EdgeInsets.only(top: 20),
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
            width: Helper.w(context) * .2,
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.asset(
                    data['image'],
                    fit: BoxFit.fill,
                  ),
                ),
                Text(
                  data['title'],
                  style: appTextstyle(size: 10, fontWeight: FontWeight.w900),
                ),
                Text(
                  'Qty: 01',
                  style: appTextstyle(size: 8, fontWeight: FontWeight.w900),
                ),
              ],
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
                'Pickup',
                style: appTextstyle(
                    color: ColorResource.grey, fontWeight: FontWeight.normal),
              ),
              Text(
                '23 March 2024 09:00 AM',
                style: appTextstyle(size: 10, fontWeight: FontWeight.bold),
              ),
              CustomeSpacer(
                vertical: .01,
              ),
              Text(
                'Drop off',
                style: appTextstyle(
                    color: ColorResource.grey, fontWeight: FontWeight.normal),
              ),
              Text(
                '26 March 2024 09:00 PM',
                style: appTextstyle(size: 10, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const Spacer(),
          SizedBox(
            // width: Helper.w(context) * .2,
            child: Column(
              children: [
                Text(
                  'Balance',
                  style: appTextstyle(size: 8, fontWeight: FontWeight.w900),
                ),
                Text(
                  orderstatus != null ? '₹ 0' : '₹ 500',
                  style: appTextstyle(size: 24, fontWeight: FontWeight.w900),
                ),
                SizedBox(
                  height: 28,
                  child: CustomeButton(
                      radius: 20,
                      bgColor: orderstatus != null
                          ? ColorResource.appThemeYello
                          : isEven
                              ? ColorResource.orange
                              : Color.fromARGB(255, 86, 174, 85),
                      onPressed: () {},
                      child: Text(
                        orderstatus != null
                            ? 'Completed'
                            : isEven
                                ? 'Pending'
                                : 'Approved',
                        style: appTextstyle(color: ColorResource.white),
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
