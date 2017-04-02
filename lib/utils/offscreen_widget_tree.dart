/*
adapted from:
https://github.com/flutter/flutter/blob/master/packages/flutter/test/widgets/independent_widget_layout_test.dart
*/

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class OffscreenWidgetTree {
  OffscreenWidgetTree(Size containerSize)
      : renderView = new _OffscreenRenderView(containerSize) {
    renderView.attach(pipelineOwner);
    renderView.scheduleInitialFrame();
  }

  final RenderView renderView;
  final buildOwner = new BuildOwner();
  final pipelineOwner = new PipelineOwner();

  RenderObjectToWidgetElement<RenderBox> root;

  void pumpWidget(Widget app) {
    root = new RenderObjectToWidgetAdapter<RenderBox>(
        container: renderView,
        debugShortDescription: '[root]',
        child: app
    ).attachToRenderTree(buildOwner, root);
    pumpFrame();
  }

  void pumpFrame() {
    buildOwner.buildScope(root);
    pipelineOwner.flushLayout();
    buildOwner.finalizeTree();
  }
}

class _OffscreenRenderView extends RenderView {
  _OffscreenRenderView(Size size)
      : super(configuration: new ViewConfiguration(size: size));

  @override
  void compositeFrame() {
    // Don't draw to ui.window
  }
}
