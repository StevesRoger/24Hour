import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:twentyfour_hour/src/component/widget/circle.dart';
import 'package:twentyfour_hour/src/screen/home/home_screen.dart';
import 'package:twentyfour_hour/src/screen/start/start_screen.dart';
import 'package:twentyfour_hour/src/util/constant.dart';
import 'package:twentyfour_hour/src/util/hex_color.dart';
import 'package:twentyfour_hour/src/util/shared_pref.dart';

class LaunchScreen extends StatefulWidget {
  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  bool isLogin = false;

  @override
  void initState() {
    super.initState();
    sharedPre.containKey('user').then((value) => isLogin = value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Builder(
          builder: (context) {
            return CarouselSlider(
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height,
                viewportFraction: 1.0,
                enlargeCenterPage: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 2),
                pauseAutoPlayInFiniteScroll: true,
                enableInfiniteScroll: false,
                onPageChanged: (index, reason) {
                  debugPrint(index.toString());
                  debugPrint(reason.toString());
                  if (index == 1) {
                    Future.delayed(const Duration(milliseconds: 3000), () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                isLogin ? HomeScreen() : StartScreen()),
                        (Route<dynamic> route) => false,
                      );
                    });
                  }
                },
                pauseAutoPlayOnManualNavigate: true,
                pauseAutoPlayOnTouch: true,
              ),
              items: <Widget>[
                _purplePanel(),
                _whitePanel(),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _purplePanel() {
    return Container(
      color: HexColor("#20144e"),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/images/launch-image.png",
              width: 200.0,
              height: 240.0,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 70.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Circle(
                    color: Themes.purple,
                  ),
                  Circle(
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _whitePanel() {
    return Stack(
      children: <Widget>[
        Container(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "assets/images/intro-image.png",
                  width: 256.0,
                  height: 203.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Best Place For\n Invest Your Money",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28.0,
                          color: Themes.purple,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          Strings.SMALL_WORDS,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Themes.blueColor,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Circle(),
                            Circle(
                              color: Themes.purple,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(45.0),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Image.asset(
            "assets/images/footer-image.png",
          ),
        ),
      ],
    );
  }
}
