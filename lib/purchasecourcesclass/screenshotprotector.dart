import 'package:screen_protector/screen_protector.dart';

void screenshot() async {
  await ScreenProtector.preventScreenshotOn();
}
