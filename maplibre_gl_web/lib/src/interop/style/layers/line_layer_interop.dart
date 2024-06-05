library maplibre.interop.style.layers.line_layer;

import 'dart:js_interop';

import 'package:maplibre_gl_web/src/style/layers/line_layer.dart';

extension type LineLayerJsImpl._(JSObject _) {
  static toJs(LineLayer lineLayer) => toDict(lineLayer).jsify();

  static toDict(LineLayer lineLayer) {
    Map<String, dynamic> dict = {
      'id': lineLayer.id,
      'type': 'line',
    };
    if (lineLayer.source != null) {
      dict['source'] =
          lineLayer.source is String ? lineLayer.source : lineLayer.source.dict;
    }
    if (lineLayer.sourceLayer != null) {
      dict['source-layer'] = lineLayer.sourceLayer;
    }
    if (lineLayer.paint != null) {
      dict['paint'] = lineLayer.paint!.dict;
    }
    if (lineLayer.layout != null) {
      dict['layout'] = lineLayer.layout!.dict;
    }
    if (lineLayer.filter != null) {
      dict['filter'] = lineLayer.filter;
    }
    return dict;
  }
}

extension type LinePaintJsImpl._(JSObject _) {
  static toJs(LinePaint linePaint) => toDict(linePaint).jsify();

  static toDict(LinePaint linePaint) {
    Map<String, dynamic> dict = {};
    if (linePaint.lineOpacity != null) {
      dict['line-opacity'] = linePaint.lineOpacity;
    }
    if (linePaint.lineColor != null) {
      dict['line-color'] = linePaint.lineColor;
    }
    if (linePaint.lineTranslate != null) {
      dict['line-translate'] = linePaint.lineTranslate;
    }
    if (linePaint.lineTranslateAnchor != null) {
      dict['line-translate-anchor'] = linePaint.lineTranslateAnchor;
    }
    if (linePaint.lineWidth != null) {
      dict['line-width'] = linePaint.lineWidth;
    }
    if (linePaint.lineGapWidth != null) {
      dict['line-gap-width'] = linePaint.lineGapWidth;
    }
    if (linePaint.lineOffset != null) {
      dict['line-offset'] = linePaint.lineOffset;
    }
    if (linePaint.lineBlur != null) {
      dict['line-blur'] = linePaint.lineBlur;
    }
    if (linePaint.lineDasharray != null) {
      dict['line-dasharray'] = linePaint.lineDasharray;
    }
    if (linePaint.linePattern != null) {
      dict['line-pattern'] = linePaint.linePattern;
    }
    if (linePaint.lineGradient != null) {
      dict['line-gradient'] = linePaint.lineGradient;
    }
    return dict;
  }
}

extension type LineLayoutJsImpl._(JSObject _) {
  static toJs(LineLayout lineLayout) => toDict(lineLayout).jsify();

  static toDict(LineLayout lineLayout) {
    Map<String, dynamic> dict = {};
    if (lineLayout.lineCap != null) {
      dict['line-cap'] = lineLayout.lineCap;
    }
    if (lineLayout.lineJoin != null) {
      dict['line-join'] = lineLayout.lineJoin;
    }
    if (lineLayout.lineMiterLimit != null) {
      dict['line-miter-limit'] = lineLayout.lineMiterLimit;
    }
    if (lineLayout.lineRoundLimit != null) {
      dict['line-round-limit'] = lineLayout.lineRoundLimit;
    }
    if (lineLayout.lineSortKey != null) {
      dict['line-sort-key'] = lineLayout.lineSortKey;
    }
    if (lineLayout.visibility != null) {
      dict['visibility'] = lineLayout.visibility;
    }
    return dict;
  }
}
