@JS('maplibregl')
library maplibre.style.interop.sources.geojson_source;

import 'dart:js_interop';

import '../../geo/geojson.dart';

extension type GeoJsonSource._(JSObject _) {
  external FeatureCollection data;
  external String promoteId;

  external GeoJsonSource(
    String? type,
    String? promoteId,
    FeatureCollection data,
  );

  external GeoJsonSource setData(FeatureCollection featureCollection);
}
