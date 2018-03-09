// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:SquanchyFlutter/favourites/favourites.dart';
import 'package:SquanchyFlutter/schedule/schedule.dart';
import 'package:SquanchyFlutter/venue/venuedetails.dart';

class Page<T> {
  BottomNavigationBarItem navItem;
  Function buildView;

  Page(T f(), BottomNavigationBarItem item) {
    buildView = f;
    navItem = item;
  }
}

class NavigationBar extends StatelessWidget {

  static const String routeName = '/cupertino/navigation';

  @override
  Widget build(BuildContext context) {

    var theme = Theme.of(context);
    var tabBarTextStyle = new TextStyle(color: Colors.blueAccent, fontFamily: 'Quicksand');
    
    var scheduleItem = new BottomNavigationBarItem(icon: new Image.asset('assets/ic_schedule_selected.png'),
        title: new Text("Schedule", style: tabBarTextStyle));
    var favouritesItem = new BottomNavigationBarItem(icon: new Image.asset('assets/ic_favourites_unselected.png'),
        title: new Text("Favourites", style: tabBarTextStyle));
    var venueDetailsItem = new BottomNavigationBarItem(icon: new Image.asset('assets/ic_venue_unselected.png'),
        title: new Text("Venue Details", style: tabBarTextStyle));

    var pages = [
      new Page<ScheduleView>(() => new ScheduleView(), scheduleItem),
      new Page<FavouritesView>(() => new FavouritesView(), favouritesItem),
      new Page<VenueDetailsView>(() => new VenueDetailsView(), venueDetailsItem),
    ];

    var tabBar = new CupertinoTabBar(
        activeColor: theme.accentIconTheme.color,
        inactiveColor: theme.iconTheme.color,
        items: pages.map((page) => page.navItem)
    );

    return new WillPopScope(
      onWillPop: preventSwipePopping,
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
                return pages[index].buildView();
              },
            ),
          );
        },
      ),
    );
  }

  Future<bool> preventSwipePopping() => new Future<bool>.value(true);
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
