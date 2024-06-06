@JS('maplibregl')
library maplibre.interop.ui.control.geolocate_control;

import 'dart:js_interop';

import 'package:maplibre_gl_web/src/interop/ui/map_interop.dart';
import 'package:maplibre_gl_web/src/interop/util/evented_interop.dart';

@JS()
@anonymous
extension type GeolocateControlOptionsJsImpl._(JSObject _) implements JSObject {
  external PositionOptionsJsImpl get positionOptions;

  external dynamic get fitBoundsOptions;

  external bool get trackUserLocation;

  external bool get showAccuracyCircle;

  external bool get showUserLocation;

  external GeolocateControlOptionsJsImpl({
    PositionOptionsJsImpl? positionOptions,
    dynamic fitBoundsOptions,
    bool? trackUserLocation,
    bool? showAccuracyCircle,
    bool? showUserLocation,
  });
}

@JS()
@anonymous
extension type PositionOptionsJsImpl._(JSObject _) implements JSObject {
  external bool get enableHighAccuracy;

  external num get maximumAge;

  external num get timeout;

  external PositionOptionsJsImpl({
    bool? enableHighAccuracy,
    num? maximumAge,
    num? timeout,
  });
}

@JS('GeolocateControl')
extension type GeolocateControlJsImpl._(EventedJsImpl _) implements EventedJsImpl {
  external GeolocateControlOptionsJsImpl get options;

  external GeolocateControlJsImpl(GeolocateControlOptionsJsImpl options);

  external onAdd(MapLibreMapJsImpl map);

  external onRemove(MapLibreMapJsImpl map);

  external trigger();
}
