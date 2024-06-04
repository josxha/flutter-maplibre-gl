@JS('maplibregl')
library maplibre.interop.style.style_image;

import 'dart:js_interop';

extension type StyleImage._(JSObject _) {
  external dynamic data;

  external num pixelRatio;

  external bool sdf;

  external num version;

  external bool hasRenderCallback;

  external StyleImageInterface userImage;
}

extension type StyleImageInterface._(JSObject _) {
  external num width;

  external num height;

  external dynamic data;

  external Function render;

  external Function(MapLibreMap map, String id) onAdd;

  external Function onRemove;
}
