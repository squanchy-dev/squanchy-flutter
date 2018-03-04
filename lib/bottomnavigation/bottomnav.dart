// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:SquanchyFlutter/favourites/favourites.dart';
import 'package:SquanchyFlutter/schedule/schedule.dart';
import 'package:SquanchyFlutter/venue/venuedetails.dart';

class CupertinoNavigationDemo extends StatelessWidget {

  static const String routeName = '/cupertino/navigation';

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      // Prevent swipe popping of this page. Use explicit exit buttons only.
      onWillPop: () => new Future<bool>.value(true),
      child: new CupertinoTabScaffold(
        tabBar: new CupertinoTabBar(
          items: const <BottomNavigationBarItem>[
            const BottomNavigationBarItem(
              icon: const Icon(CupertinoIcons.book),
              title: const Text('Schedule'),
            ),
            const BottomNavigationBarItem(
              icon: const Icon(CupertinoIcons.conversation_bubble),
              title: const Text('Favourites'),
            ),
            const BottomNavigationBarItem(
              icon: const Icon(CupertinoIcons.profile_circled),
              title: const Text('Venue Details'),
            ),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          return new DefaultTextStyle(
            style: const TextStyle(
              fontFamily: '.SF UI Text',
              fontSize: 17.0,
              color: CupertinoColors.black,
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
