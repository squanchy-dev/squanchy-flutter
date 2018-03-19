import 'package:flutter/cupertino.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton();

  @override
  Widget build(BuildContext context) {
    return new CupertinoButton(
      padding: EdgeInsets.zero,
      child: new Image.asset(
          'assets/ic_settings.png'), onPressed: () {},
    );
  }
}

class SearchButton extends StatelessWidget {
  const SearchButton();

  @override
  Widget build(BuildContext context) {
    return new CupertinoButton(
      padding: EdgeInsets.zero,
      child: new Image.asset(
          'assets/ic_search.png'), onPressed: () {},
    );
  }
}
