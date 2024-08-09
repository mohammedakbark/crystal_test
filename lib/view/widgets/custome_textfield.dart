import 'package:crystal_test/helper/widgest.dart';
import 'package:crystal_test/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String? Function(String?)? validator;
  String title;
  String hintText;
  IconData icon;
  TextEditingController controller;
  TextInputType? keyboardType;
  CustomTextField(
      {super.key,
      required this.controller,
      this.keyboardType,
      required this.hintText,
      required this.icon,
      required this.title,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomeSpacer(
          vertical: .03,
        ),
        Text(
          title,
          style: appTextstyle(size: 15, fontWeight: FontWeight.bold),
        ),
        CustomeSpacer(
          vertical: .01,
        ),
        TextFormField(
          textCapitalization: TextCapitalization.words,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: keyboardType,
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
              enabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorResource.appThemeYello),
                  borderRadius: BorderRadius.circular(8)),
              contentPadding: EdgeInsets.all(10),
              border: OutlineInputBorder(
                  borderSide: BorderSide(),
                  borderRadius: BorderRadius.circular(8)),
              hintText: hintText,
              hintStyle: appTextstyle(fontWeight: FontWeight.w300),
              suffixIcon: Icon(icon)),
        ),
      ],
    );
  }
}
