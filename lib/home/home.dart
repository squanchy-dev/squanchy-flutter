import 'package:SquanchyFlutter/utils/flexible_app_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:SquanchyFlutter/bottomnavigation/bottomnav.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}): super(key: key);

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _HomePageState();

  final scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final titleTextStyle = theme.textTheme.display1.copyWith(
      color: Colors.white,
      fontSize: 24.0,
      fontFamily: "League Spartan",
      fontWeight: FontWeight.w700,
    );


    final bottomBar = new CupertinoNavigationDemo();

    final appBar = new AppBar(
      leading: new BackButton(),
      actions: [
      ],
      bottom: new FlexibleAppBarBottomWidget
          .fromContext(context, bottomBar),
    );

    final body = new ListView(
      padding: new EdgeInsets.fromLTRB(5.0, 18.0, 24.0, 18.0),
      children: [
      ],
    );

    return new Scaffold(
      key: scaffoldKey,
      appBar: appBar,
      body: body,
      floatingActionButton: null,
      backgroundColor: const Color(0xFFF1F1F1),
    );

  }
}