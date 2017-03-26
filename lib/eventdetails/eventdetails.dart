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
    var flexibleSpaceBar = new FlexibleSpaceBar(
        title: titleWidgetFrom(event.title, event.speakers));

    var appBar = new SliverAppBar(
      leading: new BackButton(),
      actions: [
        new IconButton(
            icon: const Icon(Icons.search), onPressed: _handleSearchPress)
      ],
      flexibleSpace: flexibleSpaceBar,
    );

    var rootScrollView = new CustomScrollView(slivers: [
      appBar,
      new SliverList(
          delegate:
              new SliverChildListDelegate([]))
    ]);

    return new Scaffold(body: rootScrollView);
  }

  List<Widget> speakersChildrenFor(List<Speaker> speakers) =>
      speakers.map((speaker) {
        return new Text(speaker.fullName);
      }).toList(growable: false);

  _handleSearchPress() {}

  Widget titleWidgetFrom(String title, List<Speaker> speakers) =>
      new Column(children: [
        new Text(title),
        new Row(children: speakersChildrenFor(speakers)),
      ]);
}
