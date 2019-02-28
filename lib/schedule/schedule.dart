import 'package:SquanchyFlutter/models/EventModels.dart';
import 'package:SquanchyFlutter/schedule/schedule_item.dart';
import 'package:SquanchyFlutter/utils/button_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventList extends StatelessWidget {
  DefaultTabController _createTabs(BuildContext context, List<String> days, List<List<Event>> events) {
    var theme = Theme.of(context);
    return new DefaultTabController(
      length: days.length,
      child: new Scaffold(
        appBar: new AppBar(
          iconTheme: theme.iconTheme,
          title: const Text('SCHEDULE'),
          backgroundColor: theme.accentColor,
          actions: <Widget>[new SettingsButton(), new SearchButton()],
          bottom: new TabBar(tabs: days.map((day) => new Tab(text: day)).toList()),
        ),
        body: new TabBarView(
            children: events.map((day) {
          return _createScheduleCards(day);
        }).toList()),
      ),
    );
  }

  ListView _createScheduleCards(List<Event> events) {
    return new ListView(
      children: events.map((event) {
        return new ListTile(
          title: new EventItem(event),
        );
      }).toList(),
    );
  }

  final emptyState = new Container(
      child: new Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      new Image.asset("assets/nothing_here.png"),
      new Padding(
          padding: new EdgeInsets.only(top: 8.0),
          child: new Text('Nothing here. Come back soon!', textAlign: TextAlign.center))
    ],
  ));

  @override
  Widget build(BuildContext context) {
    var docs = Firestore.instance
        .collection('views')
        .document('schedule')
        .collection('schedule_pages')
        .getDocuments()
        .asStream();

    return new StreamBuilder<QuerySnapshot>(
      stream: docs,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return emptyState;
        var docs = snapshot.data.documents;
        Iterable<EventDay> days = docs.map((snapshot) => new EventDay(snapshot));

        var eventDays = days.map((day) => _getWeekday(day.day.dateTime.weekday)).toList();
        var events = days.map((day) => day.events).toList();
        return _createTabs(context, eventDays, events);
      },
    );
  }

  String _getWeekday(int day) {
    switch (day) {
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
    return new EventList();
  }
}
