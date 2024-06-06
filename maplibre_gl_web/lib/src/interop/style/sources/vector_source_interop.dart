@JS('maplibregl')
library maplibre.style.interop.sources.vector_source;

import 'dart:js_interop';

@JS()
@anonymous
extension type VectorSourceJsImpl._(JSObject _) implements JSObject {
  external String get url;

  external List<String> get tiles;

  external VectorSourceJsImpl({String? type, String? url, List<String>? tiles});
}
