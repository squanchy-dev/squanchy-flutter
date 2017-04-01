import 'package:SquanchyFlutter/utils/flexible_app_bar_widget.dart';
import 'package:flutter/material.dart';

import 'event.dart';

class EventDetailsPage extends StatefulWidget {
  EventDetailsPage({Key key}) : super(key: key);

  @override
  _EventDetailsPageState createState() => new _EventDetailsPageState(kEvent);
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  _EventDetailsPageState(this.event);

  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final Event event;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final titleTextStyle = theme.textTheme.display1.copyWith(
        color: Colors.white,
        fontSize: 24.0,
        fontFamily: "League Spartan",
        fontWeight: FontWeight.w700,
        );

    final speakerTextStyle = theme.textTheme.title.copyWith(
        color: Colors.white,
        fontSize: 14.0,
        height: 1.714285714,
        fontFamily: "League Spartan",
        fontWeight: FontWeight.w700,
        letterSpacing: -.1,
        );

    final labelsTextStyle = speakerTextStyle.copyWith(
        color: theme.primaryColor,
        );

    final floorTextStyle = theme.textTheme.body1.copyWith(
        color: const Color(0x8A6B6B6B),
        );

    final descriptionTextStyle = theme.textTheme.body1.copyWith(
        height: 1.95,
        );

    final titleWidget = new Padding(
        padding: new EdgeInsets.only(top: 12.0, bottom: 8.0),
        child: new Text(event.title, style: titleTextStyle));

    final appBarBottom = new Padding(
        padding: new EdgeInsets.only(left: 72.0, right: 8.0, bottom: 8.0),
        child: new Column(
            mainAxisSize: MainAxisSize.min,
            children: _speakersWidgets(speakerTextStyle, event.speakers)
              ..add(titleWidget),
            crossAxisAlignment: CrossAxisAlignment.start,
            ),
        )
    ;

    final appBar = new AppBar(
        leading: new BackButton(),
        actions: [
          new IconButton(
              icon: const Icon(Icons.search),
              onPressed: _handleSearchPress,
              ),
        ],
        bottom: new FlexibleAppBarBottomWidget
            .fromContext(context, appBarBottom),
        );

    final afterLabelInset = 72.0 - 16.0;

    final rowWhen = _rowWithLabelWidget(
        "When",
        labelsTextStyle,
        afterLabelInset,
        [
          new Text(event.when),
        ]
    );

    final rowWhere = _rowWithLabelWidget(
        "Where",
        labelsTextStyle,
        afterLabelInset,
        [
          new Text(event.where),
          new Text("   "),
          new Text(event.floor, style: floorTextStyle),
        ]
    );

    final rowAbout = new Padding(
        padding: new EdgeInsets.only(bottom: 16.0),
        child: new Text("About", style: labelsTextStyle),
        );

    final rowDescription = new Text(
        event.description,
        style: descriptionTextStyle,
        );

    final body = new ListView(
        padding: new EdgeInsets.fromLTRB(16.0, 18.0, 24.0, 18.0),
        children: [
          rowWhen,
          rowWhere,
          rowAbout,
          rowDescription,
        ],
        );

    final fab = new FloatingActionButton(
        backgroundColor: theme.primaryColor,
        onPressed: _handleFABPress,
        child: new Icon(
            Icons.favorite_border,
            color: Colors.white,
            ),
        );

    return new Scaffold(
        key: scaffoldKey,
        appBar: appBar,
        body: body,
        floatingActionButton: fab,
        backgroundColor: const Color(0xFFF1F1F1),
        );
  }

  List<Widget> _speakersWidgets
      (TextStyle speakerTextStyle, List<Speaker> speakers) {
    final speakerNames = speakers.map((speaker) => speaker.fullName).join(", ");

    final speakerNamesWidget = new Text(speakerNames, style: speakerTextStyle);

    return [
      new Row(
          children: speakers
              .map((speaker) =>
          new Padding(
              padding: new EdgeInsets.only(right: 6.0),
              child: new CircleAvatar(
                  backgroundImage: new NetworkImage(speaker.avatarUrl),
                  radius: 20.0,
                  ),
              )
          )
              .toList()),
      new Padding(
          padding: new EdgeInsets.only(top: 9.0), child: speakerNamesWidget),
    ];
  }

  Widget _rowWithLabelWidget(String label,
      TextStyle labelTextStyle,
      double labelChildrenInset,
      Iterable<Widget> children) =>
      new Padding(
          padding: new EdgeInsets.only(bottom: 32.0),
          child: new Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                new SizedBox(
                    width: labelChildrenInset,
                    child: new Text(label, style: labelTextStyle),
                    ),
              ]
                ..addAll(children),
              ),
          );

  _handleSearchPress() => _showSnackBar("¯\\_(ツ)_/¯");

  _handleFABPress() => _showSnackBar("<3");

  _showSnackBar(String text) {
    scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(text)));
  }
}
