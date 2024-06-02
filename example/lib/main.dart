import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:maplibre_gl_example/attribution.dart';
import 'package:maplibre_gl_example/given_bounds.dart';
import 'package:maplibre_gl_example/localized_map.dart';
import 'package:maplibre_gl_example/main_page.dart';
import 'package:maplibre_gl_example/map_state.dart';
import 'package:maplibre_gl_example/no_location_permission_page.dart';

import 'animate_camera.dart';
import 'annotation_order_maps.dart';
import 'click_annotations.dart';
import 'custom_marker.dart';
import 'full_map.dart';
import 'layer.dart';
import 'line.dart';
import 'local_style.dart';
import 'map_ui.dart';
import 'move_camera.dart';
import 'offline_regions.dart';
import 'place_batch.dart';
import 'place_circle.dart';
import 'place_fill.dart';
import 'place_source.dart';
import 'place_symbol.dart';
import 'scrolling_map.dart';
import 'sources.dart';

final routes = <String, WidgetBuilder>{
  ExamplePage.main.path: (context) => const MainPage(),
  ExamplePage.userInterface.path: (context) => const UserInterfacePage(),
  ExamplePage.fullscreen.path: (context) => const FullscreenMapPage(),
  ExamplePage.localized.path: (context) => const LocalizedMapPage(),
  ExamplePage.moveCameraAnimated.path: (context) => const AnimateCameraPage(),
  ExamplePage.moveCamera.path: (context) => const MoveCameraPage(),
  ExamplePage.localStyle.path: (context) => const LocalStylePage(),
  ExamplePage.scrolling.path: (context) => const ScrollingMapPage(),
  ExamplePage.offlineRegions.path: (context) => const OfflineRegionsPage(),
  ExamplePage.setMapBounds.path: (context) => const SetMapBoundsPage(),
  ExamplePage.mapState.path: (context) => const MapStatePage(),
  ExamplePage.noLocationPermission.path: (context) =>
      const NoLocationPermissionPage(),
  ExamplePage.symbol.path: (context) => const SymbolPage(),
  ExamplePage.source.path: (context) => const SourcePage(),
  ExamplePage.line.path: (context) => const LinePage(),
  ExamplePage.layer.path: (context) => const LayerPage(),
  ExamplePage.circle.path: (context) => const CirclePage(),
  ExamplePage.fill.path: (context) => const FillPage(),
  ExamplePage.batchOperation.path: (context) => const BatchOperationPage(),
  ExamplePage.annotationOrder.path: (context) => const AnnotationOrderPage(),
  ExamplePage.customMarker.path: (context) => const CustomMarkerPage(),
  ExamplePage.clickAnnotation.path: (context) => const ClickAnnotationPage(),
  ExamplePage.variousSources.path: (context) => const VariousSourcesPage(),
  ExamplePage.attribution.path: (context) => const AttributionPage(),
};

enum ExamplePage {
  main('/', 'MapLibre Examples'),
  userInterface('/user-interface', 'User interface'),
  fullscreen('/fullscreen', 'Fullscreen map'),
  localized('/localized', 'Localized map'),
  moveCameraAnimated('/move-camera-animated', 'Move camera animated'),
  moveCamera('/move-camera', 'Move camera'),
  localStyle('/local-style', 'Local style'),
  scrolling('/scrolling', 'Scrolling map'),
  offlineRegions('/offline-regions', 'Offline regions'),
  setMapBounds('/given-bounds', 'Change given bounds'),
  mapState('/map-info', 'Get map state'),
  noLocationPermission('/no-location-permission', 'No user location permission',
      needsLocationPermission: false),
  symbol('/place-symbol', 'Symbol'),
  source('/place-source', 'Source'),
  line('/line', 'Line'),
  layer('/layer', 'Layer'),
  circle('/circle', 'Circle'),
  fill('/fill', 'Fill'),
  batchOperation('/batch-operation', 'Batch operation'),
  annotationOrder('/annotation-order', 'Annotation order'),
  customMarker('/custom-marker', 'Custom marker'),
  clickAnnotation('/click-annotation', 'Click annotation'),
  variousSources('/various-sources', 'Various sources'),
  attribution('/attribution', 'Attribution');

  const ExamplePage(
    this.path,
    this.title, {
    this.needsLocationPermission = true,
  });

  final String path;
  final String title;
  final bool needsLocationPermission;
}

void main() {
  usePathUrlStrategy();
  final materialTheme = ThemeData(
    useMaterial3: true,
    colorSchemeSeed: const Color(0xff295daa),
  );

  runApp(
    MaterialApp(
      theme: materialTheme,
      initialRoute: ExamplePage.main.path,
      routes: routes,
    ),
  );
}
