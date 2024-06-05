@JS('maplibregl')
library maplibre.interop.style.style_image;

import 'dart:js_interop';
import 'package:maplibre_gl_web/src/interop/interop.dart';

@JS()
@anonymous
extension type StyleImageJsImpl._(JSObject _) {
  external dynamic get data;

  external num get pixelRatio;

  external bool get sdf;

  external num get version;

  external bool get hasRenderCallback;

  external StyleImageInterfaceJsImpl get userImage;
}

@JS()
@anonymous
extension type StyleImageInterfaceJsImpl._(JSObject _) {
  external num get width;

  external num get height;

  external dynamic get data;

  external Function get render;

  external Function(MapLibreMapJsImpl map, String id) get onAdd;

  external Function get onRemove;
}
