import 'package:SquanchyFlutter/bottomnavigation/bottomnav.dart';
import 'package:flutter/cupertino.dart';

class VenueDetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context)
  {
    return new CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: const Text('Venue Details'),
        trailing: const ExitButton(),
      ), child: new DecoratedBox(decoration: const BoxDecoration(color: const Color(0xFFEFEFF4))),
    );
  }
}
