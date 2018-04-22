import 'package:SquanchyFlutter/models/EventModels.dart';
import 'package:SquanchyFlutter/utils/button_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventList extends StatelessWidget {

  DefaultTabController _createTabs(List<String> days) {
    return new DefaultTabController(length: days.length, child:
    new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.blueAccent,
        bottom: new TabBar(
          tabs: days.map((day) => new Tab(text: day)).toList()
          ),
        ),
      )
    );
  }

  /**
   * new ListView(
      children: snapshot.data.documents.map((DocumentSnapshot document) {
      var event = new EventDay(document);
      print(event.events[0].description);

      return new ListTile(
      title: new Text(_getWeekday(event.day.dateTime.weekday)),
      );
      }).toList(),
      );
   *
   *
   */
  @override
  Widget build(BuildContext context) {
    var docs = Firestore.instance.collection('views').document('schedule').getCollection('schedule_pages').getDocuments().asStream();

    return new StreamBuilder<QuerySnapshot>(
      stream: docs,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return const Text('Loading...');
        var docs = snapshot.data.documents;
        var eventDays = docs.map((snapshot) => _getWeekday(new EventDay(snapshot).day.dateTime.weekday)).toList();
        return _createTabs(eventDays);
      },
    );
  }

  String _getWeekday(int day) {
    switch(day) {
      case 0:
        return "Monday";
      case 1:
        return "Tuesday";
      case 2:
        return "Wednesday";
      case 3:
        return "Thursday";
      case 4:
        return "Friday";
      case 5:
        return "Saturday";
      case 6:
        return "Sunday";
    }
    return "";
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
