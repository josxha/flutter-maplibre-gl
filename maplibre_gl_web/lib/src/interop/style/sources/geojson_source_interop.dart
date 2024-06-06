@JS('maplibregl')
library maplibre.style.interop.sources.geojson_source;

import 'dart:js_interop';

import 'package:maplibre_gl_web/src/interop/geo/geojson_interop.dart';

@JS()
@anonymous
extension type GeoJsonSourceJsImpl._(JSObject _) implements JSObject {
  external FeatureCollectionJsImpl get data;

  external String get promoteId;

  external GeoJsonSourceJsImpl({
    String? type,
    String? promoteId,
    FeatureCollectionJsImpl data,
  });

  external GeoJsonSourceJsImpl setData(
      FeatureCollectionJsImpl featureCollection);
}
