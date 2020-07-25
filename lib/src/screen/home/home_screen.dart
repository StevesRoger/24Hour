import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';
import 'package:twentyfour_hour/src/bloc/home_bloc.dart';
import 'package:twentyfour_hour/src/screen/home/home_screen_builder.dart';
import 'package:twentyfour_hour/src/util/constant.dart';

import 'home_screen_prop.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final prop = HomeScreenProp();

  @override
  void didChangeDependencies() {
    prop.init(
      Provider.of<HomeBloc>(context),
      context,
    );
    prop.bloc.fetchUserInfo();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Themes.purpleDark,
      resizeToAvoidBottomPadding: false,
      body: StreamBuilder(
        initialData: prop.user,
        stream: prop.bloc.userStream,
        builder: (_, snap) {
          prop.user = snap.hasData ? snap.data : null;
          return SafeArea(
            child: LoadingOverlay(
              isLoading: prop.user == null,
              progressIndicator: CircularProgressIndicator(
                backgroundColor: Themes.purple,
                valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.white,
                ),
              ),
              color: Colors.black12,
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Container(
                  alignment: Alignment.center,
                  child: Container(
                    color: Themes.purpleDark,
                    alignment: Alignment.center,
                    child: prop.user != null
                        ? Column(
                            children: <Widget>[
                              HomeScreenBuilder.buildActionBar(),
                              HomeScreenBuilder.buildProfile(
                                  context, prop.user),
                              Container(
                                color: Colors.red,
                                child: Image.asset(
                                  "assets/images/footer-banner.png",
                                  //fit: BoxFit.fill,
                                ),
                              )
                            ],
                          )
                        : Column(
                            children: <Widget>[
                              HomeScreenBuilder.buildActionBar(),
                            ],
                          ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
