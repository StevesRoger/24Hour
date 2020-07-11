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
          return SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: SafeArea(
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: _user != null ? _buildHome() : _buildLoading(),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLoading() {
    return Container(
      color: Themes.purpleDark,
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          HomeBuilder.buildActionBar(),
        ],
      ),
    );
  }

  Widget _buildHome() {
    return _user.isValid()
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
        : Container();
  }
}
