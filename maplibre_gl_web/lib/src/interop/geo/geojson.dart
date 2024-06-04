@JS('maplibregl')
library maplibre.interop.geo.geojson;

import 'dart:js_interop';

extension type FeatureCollection._(JSObject _) {
  external String type;
  external List<Feature> features;

  external FeatureCollection(String type, List<Feature> features);
}

extension type Feature._(JSObject _) {
  external dynamic id;
  external String type;
  external Geometry geometry;
  external dynamic properties;
  external String source;

  external Feature(
    dynamic id,
    String? type,
    Geometry? geometry,
    dynamic properties,
    String? source,
  );
}

extension type Geometry._(JSObject _) {
  external String type;
  external dynamic coordinates;

  external Geometry(String type, dynamic coordinates);
}
