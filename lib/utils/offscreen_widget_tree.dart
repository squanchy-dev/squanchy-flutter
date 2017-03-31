// Copyright 2016 The Chromium Authors. All rights reserved.

// from: https://github.com/flutter/flutter/blob/master/packages/flutter/test/widgets/independent_widget_layout_test.dart

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class _OffscreenRenderView extends RenderView {
  _OffscreenRenderView() : super(configuration: const ViewConfiguration(size: const Size(800.0, 600.0)));

  @override
  void compositeFrame() {
    // Don't draw to ui.window
  }
}

class OffscreenWidgetTree {
  OffscreenWidgetTree() {
    renderView.attach(pipelineOwner);
    renderView.scheduleInitialFrame();
  }

  final RenderView renderView = new _OffscreenRenderView();
  final BuildOwner buildOwner = new BuildOwner();
  final PipelineOwner pipelineOwner = new PipelineOwner();
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
