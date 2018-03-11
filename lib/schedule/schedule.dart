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
      new Image.asset("assets/nothing_here.png")
    );

    final emptyStateLabel = new Text("test");
    
    final body = new PageView(children: <Widget>[
      emptyState,
      emptyStateLabel
    ],);

    return new Scaffold(
      appBar: appBar,
      body: body,
      backgroundColor: theme.backgroundColor,
    );
  }
}
