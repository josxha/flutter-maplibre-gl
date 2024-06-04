@JS('maplibregl')
library maplibre.interop.style.evaluation_parameters;

import 'dart:js_interop';

class EvaluationParameters {
  external num zoom;
  external num now;
  external num fadeDuration;
  external dynamic zoomHistory;
  external dynamic transition;

  external factory EvaluationParameters(num zoom, [dynamic options]);

  external bool isSupportedScript(String str);

  external crossFadingFactor();

  external dynamicCrossfadeParameters();
}
