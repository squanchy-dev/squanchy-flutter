import 'package:SquanchyFlutter/rootview.dart';
import 'package:flutter/material.dart';

class SquanchyFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _theme = new ThemeData(
        primarySwatch: const MaterialColor(0XFFE65B77, const <int, Color>{
          50: const Color(0xFFFCEBEF),
          100: const Color(0xFFF8CED6),
          200: const Color(0xFFF3ADBB),
          300: const Color(0xFFEE8CA0),
          400: const Color(0xFFEA748B),
          500: const Color(0XFFE65B77),
          600: const Color(0xFFE3536F),
          700: const Color(0xFFDF4964),
          800: const Color(0xFFDB405A),
          900: const Color(0xFFD52F47),
        }),
        accentColor: const MaterialAccentColor(0xFF67B6E2, const <int, Color>{
          100: const Color(0xFF95CCEB),
          200: const Color(0xFF67B6E2),
          400: const Color(0xFF5FAFDF),
          700: const Color(0xFF4A9ED6),
        }),
        backgroundColor: const Color.fromRGBO(244, 244, 244, 1.0),
        fontFamily: "Quicksand",
        );

    final theme = _theme.copyWith(
        textTheme: _theme.textTheme.copyWith(
            body1: _theme.textTheme.body1.copyWith(
                fontWeight: FontWeight.w500,
                color: Colors.blue,
                ),
            ),
        );

    return new MaterialApp(
        theme: theme,
        title: 'Squanchy Flutter',
        home: new RootView(),
        );
  }
}
