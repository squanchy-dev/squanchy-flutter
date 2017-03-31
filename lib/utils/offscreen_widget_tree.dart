// Copyright 2016 The Chromium Authors. All rights reserved.

// from: https://github.com/flutter/flutter/blob/master/packages/flutter/test/widgets/independent_widget_layout_test.dart

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

const Size _kTestViewSize = const Size(400.0, 300.0);

class _OffscreenRenderView extends RenderView {
  _OffscreenRenderView()
      : super(configuration: const ViewConfiguration(size: _kTestViewSize));

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
    //pipelineOwner.flushCompositingBits();
    //pipelineOwner.flushPaint();
    //renderView.compositeFrame();
    //pipelineOwner.flushSemantics();
    buildOwner.finalizeTree();
  }
}
