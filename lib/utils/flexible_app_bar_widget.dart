import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'offscreen_widget_tree.dart';

class FlexibleAppBarBottomWidget extends StatelessWidget
    implements PreferredSizeWidget {
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
  Size get preferredSize {
    BuildContext savedContext;
    final builder = new Builder(
        builder: (BuildContext context) {
          savedContext = context;
          return wrapInMediaQuery(child: child);
        },
        );
    new OffscreenWidgetTree(screenSize)
        .pumpWidget(new Center(child: builder));
    return new Size.fromHeight(savedContext.size.height);
  }

  @override
  Widget build(BuildContext context) => child;

  Widget wrapInMediaQuery({Widget child}) {
    return new Directionality(
      textDirection: TextDirection.ltr,
      child: new MediaQuery(
        data: const MediaQueryData(),
        child: child,
      ),
    );
  }
}
