import 'package:flutter/material.dart';
import 'event.dart';

class EventDetailsPage extends StatefulWidget {
  EventDetailsPage({Key key}) : super(key: key);

  @override
  _EventDetailsPageState createState() => new _EventDetailsPageState(kEvent);
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  final Event event;

  _EventDetailsPageState(this.event);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(leading: new BackButton(), actions: [
        new IconButton(
            icon: const Icon(Icons.search), onPressed: _handleSearchPress())
      ]),
      body: new Center(),
    );
  }

  _handleSearchPress() {
    
  }
}
