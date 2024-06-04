@JS('maplibregl')
library maplibre.interop.ui.control.geolocate_control;

import 'dart:js_interop';

extension type GeolocateControlOptions._(JSObject _) {
  external PositionOptions positionOptions;

  external dynamic fitBoundsOptions;

  external bool trackUserLocation;

  external bool showAccuracyCircle;

  external bool showUserLocation;

  external GeolocateControlOptions(
    PositionOptions? positionOptions,
    dynamic fitBoundsOptions,
    bool? trackUserLocation,
    bool? showAccuracyCircle,
    bool? showUserLocation,
  );
}

extension type PositionOptions._(JSObject _) {
  external bool enableHighAccuracy;

  external num maximumAge;

  external num timeout;

  external PositionOptions(
    bool? enableHighAccuracy,
    num? maximumAge,
    num? timeout,
  );
}

extension type GeolocateControl._(JSObject _) {
  external GeolocateControlOptions options;

  external GeolocateControl(GeolocateControlOptions options);

  external onAdd(MapLibreMap map);

  external onRemove(MapLibreMap map);

  external trigger();
}
