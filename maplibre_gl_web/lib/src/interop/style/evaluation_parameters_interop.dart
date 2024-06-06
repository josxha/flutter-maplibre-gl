@JS('maplibregl')
library maplibre.interop.style.evaluation_parameters;

import 'dart:js_interop';

@JS('EvaluationParameters')
extension type EvaluationParametersJsImpl._(JSObject _) implements JSObject {
  external num get zoom;
  external num get now;
  external num get fadeDuration;
  external dynamic get zoomHistory;
  external dynamic get transition;

  external EvaluationParametersJsImpl(num zoom, [dynamic options]);

  external bool isSupportedScript(String str);

  external crossFadingFactor();

  external dynamic getCrossfadeParameters();
}
