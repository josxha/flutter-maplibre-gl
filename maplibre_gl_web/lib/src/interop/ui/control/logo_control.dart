@JS('maplibregl')
library maplibre.interop.ui.control.logo_control;

import 'dart:js_interop';

/// A LogoControl is a control that adds the watermark.
///
/// @implements {IControl}
/// @private
extension type LogoControl._(JSObject _) {
  external LogoControl();

  external onAdd(MapLibreMap map);

  external onRemove();

  external getDefaultPosition();
}
