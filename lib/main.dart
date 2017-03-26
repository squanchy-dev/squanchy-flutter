import 'package:flutter/material.dart';

void main() {
  runApp(new SquanchyFlutterApp());
}

class SquanchyFlutterApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Squanchy Flutter',
      theme: new ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see
          // the application has a blue toolbar. Then, without quitting
          // the app, try changing the primarySwatch below to Colors.green
          // and then invoke "hot reload" (press "r" in the console where
          // you ran "flutter run", or press Run > Hot Reload App in IntelliJ).
          // Notice that the counter didn't reset back to zero -- the application
          // is not restarted.
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
          })),
      home: new EventDetailsPage(title: 'Squanchy Flutter'),
    );
  }
}

class EventDetailsPage extends StatefulWidget {
  EventDetailsPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful,
  // meaning that it has a State object (defined below) that contains
  // fields that affect how it looks.

  // This class is the configuration for the state. It holds the
  // values (in this case the title) provided by the parent (in this
  // case the App widget) and used by the build method of the State.
  // Fields in a Widget subclass are always marked "final".

  final String title;

  @override
  _EventDetailsPageState createState() => new _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that
      // something has changed in this State, which causes it to rerun
      // the build method below so that the display can reflect the
      // updated values. If we changed _counter without calling
      // setState(), then the build method would not be called again,
      // and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance
    // as done by the _incrementCounter method above.
    // The Flutter framework has been optimized to make rerunning
    // build methods fast, so that you can just rebuild anything that
    // needs updating rather than having to individually change
    // instances of widgets.
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that
        // was created by the App.build method, and use it to set
        // our appbar title.
        title: new Text(config.title),
      ),
      body: new Center(
        child: new Text(
          'Button tapped $_counter time${ _counter == 1 ? '' : 's' }.',
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
