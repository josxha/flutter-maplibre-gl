library maplibre.interop.style.layers.circle_layer;

import 'dart:js_interop';

extension type CircleLayer._(JSObject _) {
  static toJs(CircleLayer circleLayer) => toDict(circleLayer).jsify();

  static toDict(CircleLayer circleLayer) {
    Map<String, dynamic> dict = {
      'id': circleLayer.id,
      'type': 'circle',
    };
    if (circleLayer.source != null) {
      dict['source'] = circleLayer.source is String
          ? circleLayer.source
          : circleLayer.source.dict;
    }
    if (circleLayer.sourceLayer != null) {
      dict['source-layer'] = circleLayer.sourceLayer;
    }
    if (circleLayer.paint != null) {
      dict['paint'] = circleLayer.paint!.dict;
    }
    return dict;
  }
}

extension type CirclePaint._(JSObject _) {
  static toJs(CirclePaint circlePaint) => toDict(circlePaint).jsify();

  static toDict(CirclePaint circlePaint) {
    Map<String, dynamic> dict = {};
    if (circlePaint.circleRadius != null) {
      dict['circle-radius'] = circlePaint.circleRadius;
    }
    if (circlePaint.circleColor != null) {
      dict['circle-color'] = circlePaint.circleColor;
    }
    return dict;
  }
}
