import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'offscreen_widget_tree.dart';

class FlexibleAppBarBottomWidget extends AppBarBottomWidget {
  FlexibleAppBarBottomWidget(this.screenSize, this.child);

  FlexibleAppBarBottomWidget.fromContext(BuildContext context, Widget child)
      : this(getScreenSize(context), child);

  static Size getScreenSize(BuildContext context) =>
      MediaQuery
          .of(context)
          .size;

  final Widget child;
  final Size screenSize;

  @override
  double get bottomHeight {
    BuildContext savedContext;
    final Widget builder = new Builder(
        builder: (BuildContext context) {
          savedContext = context;
          return child;
        },
        );
    new OffscreenWidgetTree(screenSize)
        .pumpWidget(new Center(child: builder));
    return savedContext.size.height;
  }

  @override
  Element createElement() => child.createElement();
}
