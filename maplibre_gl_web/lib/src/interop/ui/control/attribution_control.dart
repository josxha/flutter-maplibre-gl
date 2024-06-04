@JS('maplibregl')
library maplibre.interop.ui.control.navigation_control;

import 'dart:js_interop';

extension type AttributionControlOptions._(JSObject _) {
  external bool compact;

  external List<String>? customAttribution;

  external AttributionControlOptions(
    bool? compact,
    List<String>? customAttribution,
  );
}

/// A `AttributionControl` control contains attributions.
///
/// @implements {IControl}
/// @param {Object} [options]
/// @param {Boolean} [options.compact] If `true`, the attribution control will always collapse when moving the map. If `false`,force the expanded attribution control. The default is a responsive attribution that collapses when the user moves the map on maps less than 640 pixels wide.
/// @param {List<String>} [options.customAttribution] Attributions to show in addition to any other attributions.
/// @example
/// var attribution = new maplibregl.AttributionControl();
/// map.addControl(attribution, 'top-left');
/// @see [Display map attribution controls](https://maplibre.org/maplibre-gl-js/docs/examples/attribution-position/)
extension type AttributionControl._(JSObject _) {
  external AttributionControlOptions options;

  external AttributionControl(AttributionControlOptions options);

  external onAdd(MapLibreMap map);

  external onRemove();
}
