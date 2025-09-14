import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

void main() {
  runApp(const GeoMatrixApp());
}

class GeoMatrixApp extends StatelessWidget {
  const GeoMatrixApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GeoMatrix — Embiggen Your Eyes',
      theme: ThemeData.dark().copyWith(
        colorScheme: const ColorScheme.dark(primary: Color(0xFF10B981)),
      ),
      home: const MapPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MapPage extends StatefulWidget {
  const MapPage({super.key});
  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  String dateStr = '2025-09-01';

  // Build the WMTS URL with the date baked in (no {time} placeholder).
  String _gibsUrl(String date) =>
      'https://gibs.earthdata.nasa.gov/wmts/epsg3857/best/'
          'MODIS_Terra_CorrectedReflectance_TrueColor/default/$date/'
          'GoogleMapsCompatible_Level9/{z}/{y}/{x}.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GeoMatrix • Earth Viewer')),
      body: FlutterMap(
        options: const MapOptions(
          initialCenter: LatLng(0, 0),
          initialZoom: 2,
          maxZoom: 9, // imagery max
        ),
        children: [
          TileLayer(
            urlTemplate: _gibsUrl(dateStr),
            tileSize: 256,
            userAgentPackageName: 'com.example.geomatrix',
          ),
          RichAttributionWidget(
            alignment: AttributionAlignment.bottomRight,
            attributions: const [
              TextSourceAttribution('Imagery © NASA EOSDIS GIBS'),
            ],
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              const Text('Date: ', style: TextStyle(fontWeight: FontWeight.w600)),
              Text(dateStr),
              const Spacer(),
              FilledButton(
                onPressed: () {
                  setState(() {
                    dateStr = (dateStr == '2025-09-01') ? '2025-09-03' : '2025-09-01';
                  });
                },
                child: const Text('Toggle Date'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}