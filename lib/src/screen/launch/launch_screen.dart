import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twentyfour_hour/src/bloc/launch_bloc.dart';
import 'package:twentyfour_hour/src/component/widget/circle.dart';
import 'package:twentyfour_hour/src/util/constant.dart';

class LaunchScreen extends StatefulWidget {
  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  LaunchBloc _bloc;

  @override
  void didChangeDependencies() {
    _bloc = Provider.of<LaunchBloc>(context);
    _bloc?.init();
    _bloc?.isLogin();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
    _bloc?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder(
          initialData: false,
          stream: _bloc?.stream,
          builder: (_, snap) => CarouselSlider(
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 2),
              pauseAutoPlayInFiniteScroll: true,
              enableInfiniteScroll: false,
              onPageChanged: (index, reason) {
                if (index == 1) {
                  Future.delayed(
                    const Duration(milliseconds: 3000),
                    () => Navigator.pushNamedAndRemoveUntil(
                        context,
                        snap.data ? Routes.HOME : Routes.START,
                        (route) => false),
                  );
                }
              },
              pauseAutoPlayOnManualNavigate: true,
              pauseAutoPlayOnTouch: true,
            ),
            items: <Widget>[
              _purplePanel(),
              _whitePanel(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _purplePanel() {
    return Container(
      color: Themes.purpleDark,
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
                        Strings.BEST_PLACE,
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
