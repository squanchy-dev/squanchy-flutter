import 'package:SquanchyFlutter/models/EventModels.dart';
import 'package:SquanchyFlutter/utils/button_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Card extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return new Container(
        margin: new EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 16.0),
    constraints: new BoxConstraints.expand(),
    child: new Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
    new Container(height: 4.0),
    new Text('test',
    style: theme.textTheme.display1,
    ),
    new Container(height: 10.0),
    new Text('test 2',
    style: theme.textTheme.display4
    ),
    new Container(
    margin: new EdgeInsets.symmetric(vertical: 8.0),
    height: 2.0,
    width: 18.0,
    color: new Color(0xff00c6ff)
    ),
    new Row(
    children: <Widget>[
    new Image.asset("assets/img/ic_distance.png", height: 12.0),
    new Container(width: 8.0),
    new Text('100',
    style: theme.textTheme.display3,
    ),
    new Container(width: 24.0),
    new Image.asset("assets/img/ic_gravity.png", height: 12.0),
    new Container(width: 8.0),
    new Text(planet.gravity,
    style: regularTextStyle,
    ),
    ],
    ),
    ],
    ),
  });
}

class EventList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var docs = Firestore.instance.collection('views').document('schedule').getCollection('schedule_pages').getDocuments().asStream();

    return new StreamBuilder<QuerySnapshot>(
      stream: docs,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return const Text('Loading...');
        return new ListView(
          children: snapshot.data.documents.map((DocumentSnapshot document) {
            var event = new EventDay(document);
            print('${event.events[0].title}');
            return new ListTile(
              title: new Text(event.day.dateTime.toIso8601String()),
            );
          }).toList(),
        );
      },
    );
  }
}

class ScheduleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    var appBar = new AppBar(
        iconTheme: theme.iconTheme,
        title: const Text('SCHEDULE'),
        backgroundColor: theme.accentColor,
        actions: <Widget>[
          new SettingsButton(),
          new SearchButton()
        ]
    );

    var emptyState = new Container(child:
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new Image.asset("assets/nothing_here.png"),
              new Padding(padding: new EdgeInsets.only(top: 8.0), child: new Text('Nothing here. Come back soon!',
                textAlign: TextAlign.center,
                style: theme.textTheme.display1.copyWith(
                    color: Colors.black,
                    fontSize: 16.0),)),
            ],
          )
    );

    final body = new PageView(children: <Widget>[
      emptyState,
    ],);

    return new Scaffold(
      appBar: appBar,
      body: new EventList(),
      backgroundColor: theme.backgroundColor,
    );
  }
}
