import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';
import 'package:twentyfour_hour/src/model/user.dart';
import 'package:twentyfour_hour/src/util/constant.dart';

import '../../bloc/home_bloc.dart';
import '../../util/tools.dart';
import 'home_builder.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeBloc _bloc;
  User _user;

  @override
  void didChangeDependencies() {
    _bloc = Provider.of<HomeBloc>(context);
    _bloc?.init();
    _bloc?.fetchUserInfo();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Themes.purpleDark,
      resizeToAvoidBottomPadding: false,
      body: StreamBuilder(
        stream: _bloc.stream,
        initialData: _user,
        builder: (_, snap) {
          _user = getDataFromAsyncSnapshot(snap);
          return SafeArea(
            child: LoadingOverlay(
              isLoading: _user == null,
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
                  child: _buildHome(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHome() {
    return _user != null
        ? Container(
            color: Themes.purpleDark,
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                HomeBuilder.buildActionBar(),
                HomeBuilder.buildProfile(context, _user),
                Container(
                  color: Colors.red,
                  child: Image.asset(
                    "assets/images/footer-banner.png",
                    //fit: BoxFit.fill,
                  ),
                )
              ],
            ),
          )
        : Container(
            color: Themes.purpleDark,
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                HomeBuilder.buildActionBar(),
              ],
            ),
          );
  }
}
