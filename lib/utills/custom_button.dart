import 'package:flutter/material.dart';
import 'package:practisecorner/utills/custom_colors.dart';
import 'package:practisecorner/utills/indicator.dart';

GestureDetector custonButton(BuildContext context,
    {void Function()? onTap, String? data, bool? isloader = false}) {
  double h = MediaQuery.of(context).size.height;
  double w = MediaQuery.of(context).size.width;
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: h * 0.065,
      width: w * 1,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: CustomColors.primary, borderRadius: BorderRadius.circular(8)),
      child: isloader == true
          ? circularIndicator()
          : Text(
              data!,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'sc'),
            ),
    ),
  );
}
