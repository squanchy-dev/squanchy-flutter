import 'package:SquanchyFlutter/models/EventModels.dart';
import 'package:SquanchyFlutter/schedule/ListModel.dart';
import 'package:SquanchyFlutter/utils/button_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum EventType {
  talk,
  workshop
}

class Submission {

}

class Event {
   EventType eventType;
   String title;

   Event(EventType type, String t) {
     eventType = type;
     title = t;
   }
}

class EventCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Card(child: new Text('test'));
  }
}

_printDayStuff(DocumentSnapshot doc) {
  print('${doc['day']}');
  var day = new Day(doc['day']);
  print('${day.id}');
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
            var day = new Day(document['day']);
            return new ListTile(
              title: new Text(day.dateTime.toIso8601String()),
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
