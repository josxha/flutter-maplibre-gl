@JS('maplibregl')
library maplibre.interop.geo.point;

import 'dart:js_interop';

@JS()
@anonymous
extension type PointJsImpl._(JSObject _) implements JSObject {
  external num get x;

  external num get y;

  external PointJsImpl({num x, num y});
}
