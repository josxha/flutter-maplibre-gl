@JS('maplibregl')
library maplibre.interop.ui.control.navigation_control;

import 'dart:js_interop';

extension type NavigationControlOptions._(JSObject _) {
  external bool showCompass;

  external bool showZoom;

  external bool visualizePitch;

  external NavigationControlOptions(
    bool? showCompass,
    bool? showZoom,
    bool? visualizePitch,
  );
}

/// A `NavigationControl` control contains zoom buttons and a compass.
///
/// @implements {IControl}
/// @param {Object} [options]
/// @param {Boolean} [options.showCompass=true] If `true` the compass button is included.
/// @param {Boolean} [options.showZoom=true] If `true` the zoom-in and zoom-out buttons are included.
/// @param {Boolean} [options.visualizePitch=false] If `true` the pitch is visualized by rotating X-axis of compass.
/// @example
/// var nav = new maplibregl.NavigationControl();
/// map.addControl(nav, 'top-left');
/// @see [Display map navigation controls](https://maplibre.org/maplibre-gl-js/docs/examples/navigation/)
/// @see [Add a third party vector tile source](https://maplibre.org/maplibre-gl-js/docs/examples/third-party/)
extension type NavigationControl._(JSObject _) {
  external NavigationControlOptions options;

  external NavigationControl(NavigationControlOptions options);

  external onAdd(MapLibreMap map);

  external onRemove();
}
