import 'package:SquanchyFlutter/bottomnavigation/bottomnav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScheduleView extends StatelessWidget {
  @override
  Widget build(BuildContext context)
  {
    final theme = Theme.of(context);

    return new CupertinoPageScaffold(
      navigationBar: new CupertinoNavigationBar(
        middle: new Text('Schedule', style: theme.textTheme.headline.copyWith(color: Colors.white),),
        trailing: const SettingsButton(),
        backgroundColor: Colors.blue,
      ), child: new DecoratedBox(decoration: const BoxDecoration(color: const Color(0xFFEFEFF4))),
    );
  }
}
