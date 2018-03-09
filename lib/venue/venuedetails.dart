import 'package:SquanchyFlutter/bottomnavigation/bottomnav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VenueDetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context)
  {
    final theme = Theme.of(context);
    var appBar = new AppBar(
        iconTheme: theme.iconTheme,
        title: const Text('VENUE DETAILS'),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          new SettingsButton(),
          new SearchButton()
        ]
    );

    return new CupertinoPageScaffold(
        navigationBar: appBar, child: new Container());
  }
}
