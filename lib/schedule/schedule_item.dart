import 'package:SquanchyFlutter/models/EventModels.dart';
import 'package:flutter/material.dart';


class EventItem extends StatelessWidget {
  final Event event;

  EventItem(this.event);

  @override
  Widget build(BuildContext context) {
    final eventCard = new Container(
        decoration: new BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.circular(8.0),
          boxShadow: <BoxShadow>[
            new BoxShadow(color: Colors.black,
              blurRadius: 10.0,
              offset: new Offset(0.0, 10.0))
          ]
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
                  new Text("12:00"),
                  new Text("Lunch"),
                ]
              ),
              new Image.asset("assets/nothing_here.png"),
            ]
          )
        ],
      )
    ),);

    return new Container(
      height: 120.0,
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
