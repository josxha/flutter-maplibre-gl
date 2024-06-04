@JS('maplibregl')
library maplibre.style.interop.sources.vector_source;

import 'dart:js_interop';

extension type VectorSource._(JSObject _) {
  external String url;
  external List<String> tiles;

  external VectorSource(String? type, String? url, List<String>? tiles);
}
