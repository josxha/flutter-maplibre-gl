import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:maplibre_gl/maplibre_gl.dart';

main() {
  testWidgets('find widget in widget tree', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: MaplibreMap(
          initialCameraPosition: const CameraPosition(target: LatLng(0, 0)),
        ),
      ),
    ));
    await tester.pumpAndSettle();
    expect(find.byType(MaplibreMap), findsOneWidget);
  });
}
