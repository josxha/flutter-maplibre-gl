@JS('maplibregl')
library maplibre.style.interop.sources.vector_source;

import 'dart:js_interop';

@JS()
@anonymous
class VectorSourceJsImpl {
  external String get url;
  external List<String> get tiles;
  external factory VectorSourceJsImpl({
    String? type,
    String? url,
    List<String>? tiles,
  });
}
