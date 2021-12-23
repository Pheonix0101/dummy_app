import 'dart:math';

import 'package:dummy_app/lottie_sliders/slider_config.dart';
import 'package:flutter/material.dart';

import 'package:liquid_swipe/liquid_swipe.dart';

class SliderScreen extends StatefulWidget {
  State myApp;
  SliderScreen({this.myApp});

  @override
  _SliderScreenState createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  int page = 0;
  LiquidController liquidController;
  UpdateType updateType;

  @override
  void initState() {
    liquidController = LiquidController();
    super.initState();
  }

  List<Widget> pages;

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((page ?? 0) - index).abs(),
      ),
    );
    double zoom = 1.0 + (2.0 - 1.0) * selectedness;
    return new Container(
      width: 25.0,
      child: new Center(
        child: new Material(
          color: Colors.white,
          type: MaterialType.circle,
          child: new Container(
            width: 8.0 * zoom,
            height: 8.0 * zoom,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    pages = SliderConfig.getJourneys(context, _changeJourney);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          LiquidSwipe(
            pages: pages,
            slideIconWidget: Icon(Icons.arrow_back_ios),
            onPageChangeCallback: pageChangeCallback,
            waveType: WaveType.liquidReveal,
            liquidController: liquidController,
            ignoreUserGestureWhileAnimating: true,
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Expanded(child: SizedBox()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(pages.length, _buildDot),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: FlatButton(
                onPressed: () {
                  liquidController.animateToPage(
                    page: (liquidController.currentPage + 1) % pages.length,
                    duration: 700,
                  );
                },
                child: Text("Swipe Right"),
                color: Colors.white.withOpacity(0.01),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: FlatButton(
                onPressed: () {
                  liquidController.animateToPage(
                    page: (liquidController.currentPage - 1 + pages.length) %
                        pages.length,
                    duration: 700,
                  );
                },
                child: Text("Swipe Left"),
                color: Colors.white.withOpacity(0.01),
              ),
            ),
          )
        ],
      ),
    );
  }

  pageChangeCallback(int lpage) {
    setState(() {
      page = lpage;
    });
  }

  Future<void> _changeJourney(String journey) async {
    Navigator.pop(context); //..pop
  }
}
