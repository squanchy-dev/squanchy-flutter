import 'package:SquanchyFlutter/models/EventModels.dart';
import 'package:flutter/material.dart';


class EventItem extends StatelessWidget {
  final Event event;

  EventItem(this.event);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final eventCard = new Container(
        decoration: new BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.circular(8.0),
    ),
    child: new Container(
      margin: const EdgeInsets.only(top: 5.0, left: 5.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Row(
            children: <Widget>[
              new Column(
                children: <Widget>[
                  new Container(height: 5.0),
                  new Text("12:00", style: Theme.of(context).primaryTextTheme.title.copyWith(color: theme.accentColor)),
                  new Container(height: 10.0),
                  new Text("Lunch"),
                ]
              ),
              new Container(width: 150.0),
              new Center(child: new Image.asset("assets/nothing_here.png", width: 100.0, height: 40.0)),
            ]
          )
        ],
      )
    ),);

    return new Container(
      height: 80.0,
      child: new FlatButton(
        onPressed: null,
        child: new Stack(
          children: <Widget>[
            eventCard
          ],
        ),
      ),
    );
  }
}
