// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'dart:math' as math;

import 'package:SquanchyFlutter/eventdetails/eventdetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:SquanchyFlutter/favourites/favourites.dart';
import 'package:SquanchyFlutter/schedule/schedule.dart';
import 'package:SquanchyFlutter/venue/venuedetails.dart';

class NavigationBar extends StatelessWidget {

  static const String routeName = '/cupertino/navigation';

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var tabBarTextStyle = new TextStyle(color: Colors.blueAccent, fontFamily: 'Quicksand');

    var tabBar = new CupertinoTabBar(
        activeColor: theme.accentIconTheme.color,
        inactiveColor: theme.iconTheme.color,

        items: [
          new BottomNavigationBarItem(icon: new Image.asset('assets/ic_schedule_selected.png'), title: new Text("Schedule", style: tabBarTextStyle)),
          new BottomNavigationBarItem(icon: new Image.asset('assets/ic_favourites_unselected.png'), title: new Text("Favourites", style: tabBarTextStyle)),
          new BottomNavigationBarItem(icon: new Image.asset('assets/ic_venue_unselected.png'), title: new Text("Venue Details", style: tabBarTextStyle))
        ]);


    return new WillPopScope(
      // Prevent swipe popping of this page. Use explicit exit buttons only.
      onWillPop: () => new Future<bool>.value(true),
      child: new CupertinoTabScaffold(
        tabBar: tabBar,
        tabBuilder: (BuildContext context, int index) {
          return new DefaultTextStyle(
            style: const TextStyle(
              fontFamily: '.SF UI Text',
              fontSize: 17.0,
              color: Colors.blue,
            ),
            child: new CupertinoTabView(
              builder: (BuildContext context) {
                switch (index) {
                  case 0:
                    return new ScheduleView();
                    break;
                  case 1:
                    return new FavouritesView();
                    break;
                  case 2:
                    return new VenueDetailsView();
                    break;
                  default:
                }
              },
            ),
          );
        },
      ),
    );
  }
}

class SettingsButton extends StatelessWidget {
  const SettingsButton();

  @override
  Widget build(BuildContext context) {
    return new CupertinoButton(
      padding: EdgeInsets.zero,
      child: new Image.asset(
        'assets/ic_settings.png'), onPressed: () {},
    );
  }
}

class SearchButton extends StatelessWidget {
  const SearchButton();

  @override
  Widget build(BuildContext context) {
    return new CupertinoButton(
      padding: EdgeInsets.zero,
      child: new Image.asset(
          'assets/ic_search.png'), onPressed: () {},
    );
  }
}
