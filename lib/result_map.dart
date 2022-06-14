import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class ResultMapPage extends StatefulWidget {
  const ResultMapPage(
      {Key? key,
      required this.title,
      required this.address,
      required this.lat,
      required this.lng})
      : super(key: key);

  final String title;
  final String address;
  final double lat;
  final double lng;

  @override
  State<ResultMapPage> createState() => _ResultMapPageState();
}

class _ResultMapPageState extends State<ResultMapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FlutterMap(
        options: MapOptions(
          // TODO: bawah khatulistiwa
          center: LatLng(widget.lat - 0.005, widget.lng),
          zoom: 15.0,
        ),
        layers: [
          TileLayerOptions(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c']),
          MarkerLayerOptions(
            markers: [
              Marker(
                width: 50.0,
                height: 50.0,
                point: LatLng(widget.lat, widget.lng),
                builder: (ctx) => const Icon(Icons.location_pin, size: 50),
              ),
            ],
          ),
        ],
      ),
      bottomSheet: Material(
        elevation: 4,
        child: Container(
          padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
          width: double.infinity,
          height: 140,
          color: const Color.fromRGBO(219, 236, 202, 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text(widget.title), Text(widget.address)],
          ),
        ),
      ),
    );
  }
}
