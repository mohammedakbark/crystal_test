import 'package:crystal_test/helper/helper.dart';
import 'package:crystal_test/helper/widgest.dart';
import 'package:crystal_test/utils/colors.dart';
import 'package:crystal_test/view/widgets/custome_button.dart';
import 'package:crystal_test/view/widgets/custome_textfield.dart';
import 'package:crystal_test/view/widgets/screen_margin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({super.key});

  TextEditingController _nameController = TextEditingController();
  TextEditingController _mobileNumberController = TextEditingController();

  TextEditingController _emailController = TextEditingController();

  TextEditingController _drivingLicenceNumberController =
      TextEditingController();

  TextEditingController _emergencyContactNumberController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ScreenMargin(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
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
              CustomTextField(
                controller: _nameController,
                hintText: 'Please enter your full name',
                icon: Icons.person_outline_rounded,
                title: 'Full name',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter your name';
                  } else {
                    return null;
                  }
                },
              ),
              CustomTextField(
                keyboardType: TextInputType.number,
                controller: _mobileNumberController,
                hintText: 'Please enter your mobile number',
                icon: Icons.phone_android_sharp,
                title: 'Mobile number',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter your mobile number';
                  } else if (value.length > 10) {
                    return 'Number must not greater than 10 digit';
                  } else {
                    return null;
                  }
                },
              ),
              CustomTextField(
                controller: _emailController,
                hintText: 'Please enter your email address',
                icon: Icons.mail_outline_outlined,
                title: 'Email address',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter your email address';
                  } else if (!value.contains('@gmail.com')) {
                    return 'Enter valid email address';
                  } else {
                    return null;
                  }
                },
              ),
              CustomTextField(
                controller: _drivingLicenceNumberController,
                hintText: 'Driving License Number',
                icon: Icons.contact_emergency_outlined,
                title: 'Driving License Number',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter your DLN';
                  } else if (value.length > 16) {
                    return 'Enter valid DLN ';
                  } else {
                    return null;
                  }
                },
              ),
              CustomTextField(
                controller: _emergencyContactNumberController,
                hintText: 'Emergency contact number',
                icon: Icons.phone_android_sharp,
                title: 'Emergency contact number',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter your number ';
                  } else if (value.length > 10) {
                    return 'Number must not greater than 10 digit';
                  } else {
                    return null;
                  }
                },
              ),
              CustomeSpacer(
                vertical: .08,
              ),
              SizedBox(
                width: Helper.w(context),
                height: Helper.h(context) * .06,
                child: CustomeButton(
                    radius: 30,
                    bgColor: ColorResource.appThemeYello,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: ColorResource.green,
                                content:
                                    Text('Profile updated Successful !!')));
                      }
                    },
                    child: Text(
                      'Update Profile',
                      style:
                          appTextstyle(size: 18, fontWeight: FontWeight.bold),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
