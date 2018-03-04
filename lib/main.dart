import 'package:flutter/material.dart';

import 'squanchy_app.dart';

void main() {
  runApp(new SquanchyFlutterApp());
}

class ControlleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Controlle Financeiro",
      home: new HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: new Color(0x673AB7),
      ),
    );
  }
}
