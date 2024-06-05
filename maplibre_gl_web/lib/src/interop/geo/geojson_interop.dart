@JS('maplibregl')
library maplibre.interop.geo.geojson;

import 'dart:js_interop';

@JS()
@anonymous
extension type FeatureCollectionJsImpl._(JSObject _) {
  external String get type;

  external List<FeatureJsImpl> get features;

  external FeatureCollectionJsImpl({
    String type,
    List<FeatureJsImpl> features,
  });
}

@JS()
@anonymous
extension type FeatureJsImpl._(JSObject _) {
  external dynamic get id;

  external set id(dynamic id);

  external String get type;

  external GeometryJsImpl get geometry;

  external dynamic get properties;

  external String get source;

  external FeatureJsImpl({
    dynamic id,
    String? type,
    GeometryJsImpl geometry,
    dynamic properties,
    String? source,
  });
}

@JS()
@anonymous
extension type GeometryJsImpl._(JSObject _) {
  external String get type;

  external dynamic get coordinates;

  external GeometryJsImpl({String? type, dynamic coordinates});
}
