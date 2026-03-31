// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:practisecorner/utills/custom_colors.dart';

// circularIndicator() {
//   return const Center(
//     child: CircularProgressIndicator.adaptive(
//       backgroundColor: Colors.transparent,
//       strokeWidth: 3,
//     ),
//   );
// }

Center circularIndicator({bool color = false}) {
  return Center(
    child: SpinKitThreeBounce(
      color: color == false ? Colors.white : CustomColors.primary,
      size: 16.0,
    ),
  );
}

circularIndicator1() {
  return Align(
    alignment: Alignment.centerRight,
    child: SpinKitThreeBounce(
      color: CustomColors.primary,
      size: 16.0,
    ),
  );
}
