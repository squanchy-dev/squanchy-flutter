import 'package:SquanchyFlutter/models/EventModels.dart';
import 'package:flutter/material.dart';


class EventItem extends StatelessWidget {
  final Event event;

  EventItem(this.event);

  @override
  Widget build(BuildContext context) {
    final eventCard = new Container(
        margin: const EdgeInsets.only(left: 72.0, right: 24.0),
        decoration: new BoxDecoration(
          color: Colors.grey,
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.circular(8.0),
          boxShadow: <BoxShadow>[
            new BoxShadow(color: Colors.black,
              blurRadius: 10.0,
              offset: new Offset(0.0, 10.0))
          ]
    ),
    child: new Container(
      margin: const EdgeInsets.only(top: 16.0, left: 72.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text("test"),
          new Text("next text"),
          new Container(
            color: Colors.blue,
            width: 24.0,
            height: 1.0,
            margin: const EdgeInsets.symmetric(vertical: 8.0)
          ),
          new Row(
            children: <Widget>[
              new Icon(Icons.location_on, size: 14.0,
                color: Colors.black),
              new Text("123"),
              new Container(width: 24.0),
              new Icon(Icons.flight_land, size: 14.0,
                color: Colors.white),
              new Text("321"),
            ],
          )
        ],
      )
    ),);

    return new Container(
      height: 120.0,
      margin: const EdgeInsets.only(top: 16.0, bottom: 8.0),
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
