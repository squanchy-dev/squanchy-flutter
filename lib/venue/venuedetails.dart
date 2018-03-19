import 'package:SquanchyFlutter/utils/button_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VenueDetailsView extends StatelessWidget {

  @override
  Widget build(BuildContext context)
  {
    final theme = Theme.of(context);

    Firestore.instance.collection('conference_info').getDocuments().asStream().listen(
        (data) => print('${data.documents[0]['name']}')
    );

    var appBar = new AppBar(
        iconTheme: theme.iconTheme,
        title: const Text('VENUE DETAILS'),
        backgroundColor: theme.accentColor,
        actions: <Widget>[
          new SettingsButton(),
          new SearchButton()
        ]
    );


    return new Scaffold(
      appBar: appBar,
      backgroundColor: theme.backgroundColor,
    );
  }
}
