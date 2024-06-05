@JS('maplibregl')
library maplibre.interop.ui.control.logo_control;

import 'dart:js_interop';
import 'package:maplibre_gl_web/src/interop/ui/map_interop.dart';

/// A LogoControl is a control that adds the watermark.
///
/// @implements {IControl}
/// @private
@JS('LogoControl')
extension type LogoControlJsImpl._(JSObject _) {
  external LogoControlJsImpl();

  external onAdd(MapLibreMapJsImpl map);

  external onRemove();

  external getDefaultPosition();
}
