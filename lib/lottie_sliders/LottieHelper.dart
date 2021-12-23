import 'package:lottie/lottie.dart';

class LottieHelper{
  static const String _LOTTIE1 = "assets/lottie1.json";
  static const String _LOTTIE2 = "assets/lottie2.json";
  static const String _LOTTIE3 = "assets/lottie3.json";
  static const String _LOTTIE4 = "assets/lottie4.json";

  static LottieBuilder lottie1() => Lottie.asset(_LOTTIE1, frameRate: FrameRate(60));

  static LottieBuilder lottie2() => Lottie.asset(_LOTTIE2, frameRate: FrameRate(60));

  static LottieBuilder lottie3() => Lottie.asset(_LOTTIE4, frameRate: FrameRate(60));

  static LottieBuilder lottie4() => Lottie.asset(_LOTTIE3, frameRate: FrameRate(60));
}
