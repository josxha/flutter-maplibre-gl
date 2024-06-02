import 'dart:io';

import 'package:flutter/material.dart';
import 'package:maplibre_gl/maplibre_gl.dart';
import 'package:maplibre_gl_example/main.dart';
import 'package:maplibre_gl_example/widgets/example_scaffold.dart';
import 'package:path_provider/path_provider.dart';

class LocalStylePage extends StatefulWidget {
  const LocalStylePage({super.key});

  @override
  State<LocalStylePage> createState() => _LocalStylePageState();
}

class _LocalStylePageState extends State<LocalStylePage> {
  MaplibreMapController? mapController;
  String? styleAbsoluteFilePath;

  @override
  initState() {
    super.initState();

    getApplicationDocumentsDirectory().then((dir) async {
      String documentDir = dir.path;
      String stylesDir = '$documentDir/styles';
      String styleJSON =
          '{"version":8,"name":"Demo style","center":[50,10],"zoom":4,"sources":{"demotiles":{"type":"vector","url":"https://demotiles.maplibre.org/tiles/tiles.json"}},"sprite":"","glyphs":"https://orangemug.github.io/font-glyphs/glyphs/{fontstack}/{range}.pbf","layers":[{"id":"background","type":"background","paint":{"background-color":"rgba(255, 255, 255, 1)"}},{"id":"countries","type":"line","source":"demotiles","source-layer":"countries","paint":{"line-color":"rgba(0, 0, 0, 1)","line-width":1,"line-opacity":1}}]}';

      await Directory(stylesDir).create(recursive: true);

      File styleFile = File('$stylesDir/style.json');

      await styleFile.writeAsString(styleJSON);

      setState(() {
        styleAbsoluteFilePath = styleFile.path;
      });
    });
  }

  void _onMapCreated(MaplibreMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    final styleAbsoluteFilePath = this.styleAbsoluteFilePath;

    if (styleAbsoluteFilePath == null) {
      return const Scaffold(
        body: Center(child: Text('Creating local style file...')),
      );
    }

    return ExampleScaffold(
      page: ExamplePage.localStyle,
      body: MaplibreMap(
        styleString: styleAbsoluteFilePath,
        onMapCreated: _onMapCreated,
        initialCameraPosition: const CameraPosition(target: LatLng(0.0, 0.0)),
        onStyleLoadedCallback: onStyleLoadedCallback,
      ),
    );
  }

  void onStyleLoadedCallback() {}
}
