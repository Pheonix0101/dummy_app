import 'package:flutter/material.dart';

import 'package:dummy_app/lottie_sliders/constants.dart';
import 'package:dummy_app/lottie_sliders/LottieHelper.dart';

class SliderConfig {
  static List<Map<String, dynamic>> _journeysConfig() => [
        {
          'lightColor': Colors.lightGreen,
          'darkColor': Colors.green,
          'screen': Constants.Screen1,
          'screenLottie': LottieHelper.lottie1(),
          'screenTitle': Constants.Screen4,
          'journeyDescription':
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
        },
        {
          'lightColor': Colors.blue,
          'darkColor': Colors.blueAccent,
          'screen': Constants.Screen2,
          'screenLottie': LottieHelper.lottie2(),
          'screenTitle': Constants.Screen4,
          'journeyDescription':
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
        },
        {
          'lightColor': Colors.deepPurple,
          'darkColor': Colors.purple,
          'screen': Constants.Screen3,
          'screenLottie': LottieHelper.lottie3(),
          'screenTitle': Constants.Screen4,
          'journeyDescription':
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
        },
        {
          'lightColor': Colors.deepOrange.shade400,
          'darkColor': Colors.orange,
          'screen': Constants.Screen4,
          'screenLottie': LottieHelper.lottie4(),
          'screenTitle': Constants.Screen4,
          'journeyDescription':
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
        },
      ];

  static List<Widget> getJourneys(
      BuildContext context, Function changeJourney) {
    List<Map<String, dynamic>> configList = _journeysConfig();
    Size size = MediaQuery.of(context).size;
    return configList
        .map(
          (Map<String, dynamic> config) => Container(
            color: config['lightColor'],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Flexible(child: config['screenLottie'], flex: 4),
                Flexible(
                  flex: 3,
                  child: Column(
                    children: [
                      Text(
                        config['screenTitle'],
                      ),
                      SizedBox(
                        height: size.height / 20,
                      ),
                      Text(
                        config['journeyDescription'],
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: SizedBox(),
                ),
              ],
            ),
          ),
        )
        .toList();
  }
}
