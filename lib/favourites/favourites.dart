import 'package:SquanchyFlutter/bottomnavigation/bottomnav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/colors.dart';

class FavouritesView extends StatelessWidget {
  @override
  Widget build(BuildContext context)
  {
    final theme = Theme.of(context);

    return new CupertinoPageScaffold(
      navigationBar: new CupertinoNavigationBar(
        middle: new Text('Favourites', style: theme.textTheme.headline.copyWith(color: Colors.white),),
        trailing: const SettingsButton(),
        backgroundColor: Colors.blue,
      ), child: new Container(
      decoration: new BoxDecoration(color: Colors.red),
      child: new Center(
        child: new Image.asset('assets/ic_settings.png'))
    ));
  }
}
