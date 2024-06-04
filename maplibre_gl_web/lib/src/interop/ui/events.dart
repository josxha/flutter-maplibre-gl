@JS('maplibregl')
library maplibre.interop.ui.events;

import 'package:web/web.dart';
import 'dart:js_interop';

extension type MapMouseEvent._(JSObject _) {
  /// The event type.
  external String type;

  /// The `MapLibreMap` object that fired the event.
  external MapLibreMap target;

  /// The DOM event which caused the map event.
  external MouseEvent originalEvent;

  /// The pixel coordinates of the mouse cursor, relative to the map and measured from the top left corner.
  external Point point;

  /// The geographic location on the map of the mouse cursor.
  external LngLat lngLat;

  ///  Prevents subsequent default processing of the event by the map.
  ///
  ///  Calling this method will prevent the following default map behaviors:
  ///
  ///  *  On `mousedown` events, the behavior of {@link DragPanHandler}
  ///  *  On `mousedown` events, the behavior of {@link DragRotateHandler}
  ///  *  On `mousedown` events, the behavior of {@link BoxZoomHandler}
  ///  *  On `dblclick` events, the behavior of {@link DoubleClickZoomHandler}
  external preventDefault();

  /// `true` if `preventDefault` has been called.
  external bool defaultPrevented;
}

extension type MapTouchEvent(JSObject _) {
  /// The event type.
  external String type;

  /// The `MapLibreMap` object that fired the event.
  external MapLibreMap target;

  /// The DOM event which caused the map event.
  external TouchEvent originalEvent;

  /// The geographic location on the map of the center of the touch event points.
  external LngLat lngLat;

  /// The pixel coordinates of the center of the touch event points, relative to the map and measured from the top left
  /// corner.
  external Point point;

  ///  The array of pixel coordinates corresponding to a
  ///  [touch event's `touches`](https://developer.mozilla.org/en-US/docs/Web/API/TouchEvent/touches) property.
  external List<Point> points;

  ///  The geographical locations on the map corresponding to a
  ///  [touch event's `touches`](https://developer.mozilla.org/en-US/docs/Web/API/TouchEvent/touches) property.
  external List<LngLat> lngLats;

  ///  Prevents subsequent default processing of the event by the map.
  ///
  ///  Calling this method will prevent the following default map behaviors:
  ///
  ///  *  On `touchstart` events, the behavior of {@link DragPanHandler}
  ///  *  On `touchstart` events, the behavior of {@link TouchZoomRotateHandler}
  external preventDefault();

  ///  `true` if `preventDefault` has been called.
  external bool defaultPrevented;
}
