import 'package:SquanchyFlutter/utils/button_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScheduleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    var appBar = new AppBar(
        iconTheme: theme.iconTheme,
        title: const Text('SCHEDULE'),
        backgroundColor: theme.accentColor,
        actions: <Widget>[
          new SettingsButton(),
          new SearchButton()
        ]
    );

    final emptyState = new Container(child:
      new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new Image.asset("assets/nothing_here.png"),
            new Text('Nothing here. Come back soon!',
              textAlign: TextAlign.center,
              style: theme.textTheme.display1.copyWith(color: Colors.black, fontSize: 16.0),),
          ],
      )
    );

    final body = new PageView(children: <Widget>[
      emptyState,
    ],);

    return new Scaffold(
      appBar: appBar,
      body: body,
      backgroundColor: theme.backgroundColor,
    );
  }
}
