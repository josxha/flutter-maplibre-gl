@JS('maplibregl')
library maplibre.interop.style.style;

import 'dart:js_interop';

extension type StyleSetterOptions._(JSObject _) {
  external bool validate;
}

extension type Style._(JSObject _) {
  external loadURL(String url, dynamic options);

  external loadJSON(dynamic json, StyleSetterOptions option);

  external loaded();

  external hasTransitions();

  ///  Apply queued style updates in a batch and recalculate zoom-dependent paint properties.
  external update(EvaluationParameters parameters);

  ///  Update this style's state to match the given style JSON, performing only
  ///  the necessary mutations.
  ///
  ///  May throw an Error ('Unimplemented: METHOD') if the maplibre-gl-style-spec
  ///  diff algorithm produces an operation that is not supported.
  ///
  ///  @returns {boolean} true if any changes were made; false otherwise
  ///  @private
  external setState(dynamic nextState);

  external addImage(String id, StyleImage image);

  external updateImage(String id, StyleImage image);

  external StyleImage getImage(String id);

  external removeImage(String id);

  external listImages();

  external addSource(String id, dynamic source, StyleSetterOptions options);

  ///  Remove a source from this stylesheet, given its id.
  ///  @param {string} id id of the source to remove
  ///  @throws {Error} if no source is found with the given ID
  external removeSource(String id);

  ///  Set the data of a GeoJSON source, given its id.
  ///  @param {string} id id of the source
  ///  @param {GeoJSON|string} data GeoJSON source
  external setGeoJSONSourceData(String id, dynamic data);

  ///  Get a source by id.
  ///  @param {string} id id of the desired source
  ///  @returns {Object} source
  external dynamic getSource(String id);

  ///  Add a layer to the map style. The layer will be inserted before the layer with
  ///  ID `before`, or appended if `before` is omitted.
  ///  @param {string} [before] ID of an existing layer to insert before
  external addLayer(dynamic layerObject, [String? before, StyleSetterOptions? options]);

  ///  Moves a layer to a different z-position. The layer will be inserted before the layer with
  ///  ID `before`, or appended if `before` is omitted.
  ///  @param {string} id  ID of the layer to move
  ///  @param {string} [before] ID of an existing layer to insert before
  external moveLayer(String id, [String? before]);

  ///  Remove the layer with the given id from the style.
  ///
  ///  If no such layer exists, an `error` event is fired.
  ///
  ///  @param {string} id id of the layer to remove
  ///  @fires error
  external removeLayer(String id);

  ///  Return the style layer object with the given `id`.
  ///
  ///  @param {string} id - id of the desired layer
  ///  @returns {?Object} a layer, if one with the given `id` exists
  external dynamic getLayer(String id);

  external setLayerZoomRange(String layerId, [num? minzoom, num? maxzoom]);

  external setFilter(String layerId, dynamic filter, StyleSetterOptions options);

  ///  Get a layer's filter object
  ///  @param {string} layer the layer to inspect
  ///  @returns {*} the layer's filter, if any
  external getFilter(String layer);

  external setLayoutProperty(
      String layerId, String name, dynamic value, StyleSetterOptions options);

  ///  Get a layout property's value from a given layer
  ///  @param {string} layerId the layer to inspect
  ///  @param {string} name the name of the layout property
  ///  @returns {*} the property value
  external getLayoutProperty(String layerId, String name);

  external setPaintProperty(
      String layerId, String name, dynamic value, StyleSetterOptions options);

  external getPaintProperty(String layer, String name);

  external setFeatureState(dynamic target, dynamic state);

  external removeFeatureState(dynamic target, [String? key]);

  external getFeatureState(dynamic target);

  external getTransition();

  external serialize();

  external querySourceFeatures(String sourceID, dynamic params);

  external addSourceType(String name, dynamic sourceType, Function callback);

  external getLight();

  external setLight(dynamic lightOptions, StyleSetterOptions options);

  // Callbacks from web workers

  external getImages(String mapId, dynamic params, Function callback);

  external getGlyphs(String mapId, dynamic params, Function callback);

  external getResource(String mapId, RequestParameters params, Function callback);

  external List<dynamic> layers;
}

extension type StyleFunction._(JSObject _) {
  external factory StyleFunction(dynamic base, dynamic stops);
}
