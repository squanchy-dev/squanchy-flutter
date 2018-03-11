import 'package:SquanchyFlutter/utils/button_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavouritesView extends StatelessWidget {
  @override
  Widget build(BuildContext context)
  {
    final theme = Theme.of(context);

    var appBar = new AppBar(
        iconTheme: theme.iconTheme,
        title: const Text('FAVOURITES'),
        backgroundColor: theme.accentColor,
        actions: <Widget>[
          new SettingsButton(),
          new SearchButton()
        ]
    );

    return new Scaffold(
      appBar: appBar,
      backgroundColor: theme.backgroundColor,
    );
  }
}
