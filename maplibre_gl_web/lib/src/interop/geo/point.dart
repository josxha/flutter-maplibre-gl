@JS('maplibregl')
library maplibre.interop.geo.point;

import 'dart:js_interop';

extension type Point._(JSObject _) {
  external num x;
  external num y;

  external Point(num x, num y);
}
