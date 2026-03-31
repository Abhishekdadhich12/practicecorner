// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// circularIndicator() {
//   return const Center(
//     child: CircularProgressIndicator.adaptive(
//       backgroundColor: Colors.transparent,
//       strokeWidth: 3,
//     ),
//   );
// }

Center circularIndicator() {
  return const Center(
    child: SpinKitThreeBounce(
      color: Color(0xff0FC393),
      size: 16.0,
    ),
  );
}

circularIndicator1() {
  return const Align(
    alignment: Alignment.centerRight,
    child: SpinKitThreeBounce(
      color: Color(0xff0FC393),
      size: 16.0,
    ),
  );
}
