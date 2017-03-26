import 'package:flutter/material.dart';

import 'event.dart';

class EventDetailsPage extends StatefulWidget {
  EventDetailsPage({Key key}) : super(key: key);

  @override
  _EventDetailsPageState createState() => new _EventDetailsPageState(kEvent);
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  _EventDetailsPageState(this.event);

  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  final Event event;

  ThemeData theme;

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);

    var appBar = new SliverAppBar(
      leading: new BackButton(),
      actions: [
        new IconButton(
            icon: const Icon(Icons.search), onPressed: _handleSearchPress)
      ],
    );

    Text titleWidget = new Text(event.title,
        style: theme.textTheme.display1.copyWith(
            color: Colors.white, fontSize: 24.0, height: 1.714285714));

    var rootScrollView = new CustomScrollView(slivers: [
      appBar,
      new SliverList(
          delegate: new SliverChildListDelegate([
        new Container(
          decoration: new BoxDecoration(backgroundColor: theme.primaryColor),
          child: new Padding(
              padding: new EdgeInsets.fromLTRB(72.0, 8.0, 8.0, 8.0),
              child: new Column(
                  children: new List.from(speakersChildrenFor(event.speakers))
                    ..add(titleWidget),
                  crossAxisAlignment: CrossAxisAlignment.start)),
        )
      ]))
    ]);

    return new Scaffold(key: scaffoldKey, body: rootScrollView);
  }

  List<Widget> speakersChildrenFor(List<Speaker> speakers) {
    var speakerNames = speakers.map((speaker) => speaker.fullName).join(", ");

    var speakerNamesWidget = new Text(speakerNames,
        style: theme.textTheme.display1.copyWith(
            color: Colors.white, fontSize: 14.0, height: 1.714285714));

    return <Widget>[
      new Row(
          children: speakers
              .map((speaker) => new CircleAvatar(
                  backgroundImage: new NetworkImage(speaker.avatarUrl),
                  radius: 20.0))
              .map((widget) => new Padding(
                  padding: new EdgeInsets.only(right: 8.0), child: widget))
              .toList()),
      new Padding(
          padding: new EdgeInsets.only(top: 8.0), child: speakerNamesWidget),
    ];
  }

  _handleSearchPress() {
    scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text("¯\\_(ツ)_/¯")));
  }
}
