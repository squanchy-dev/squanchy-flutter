import 'package:SquanchyFlutter/bottomnavigation/bottomnav.dart';
import 'package:flutter/cupertino.dart';

class FavouritesView extends StatelessWidget {
  @override
  Widget build(BuildContext context)
  {
    return new CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: const Text('Favourites'),
        trailing: const ExitButton(),
      ), child: new DecoratedBox(decoration: const BoxDecoration(color: const Color(0xFFEFEFF4))),
    );
  }
}
