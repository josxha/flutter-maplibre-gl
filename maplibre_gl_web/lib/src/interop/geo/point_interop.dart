@JS('maplibregl')
library maplibre.interop.geo.point;

import 'dart:js_interop';

@JS()
@anonymous
class PointJsImpl {
  external num get x;
  external num get y;

  external factory PointJsImpl({
    num x,
    num y,
  });
}
