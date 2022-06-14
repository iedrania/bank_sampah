// To parse this JSON data, do
//
//     final bsOverpassData = bsOverpassDataFromJson(jsonString);

import 'dart:convert';

BsOverpassData bsOverpassDataFromJson(String str) => BsOverpassData.fromJson(json.decode(str));

class BsOverpassData {
  BsOverpassData({
    required this.version,
    required this.generator,
    // required this.osm3S,
    required this.elements,
  });

  double version;
  String generator;
  // Osm3S osm3S;
  List<Element> elements;

  factory BsOverpassData.fromJson(Map<String, dynamic> json) => BsOverpassData(
    version: json["version"].toDouble(),
    generator: json["generator"],
    // osm3S: Osm3S.fromJson(json["osm3s"]),
    elements: List<Element>.from(json["elements"].map((x) => Element.fromJson(x))),
  );
}

class Element {
  Element({
    required this.type,
    required this.id,
    // this.lat,
    // this.lon,
    required this.tags,
    // this.center,
  });

  String type;
  int id;
  // double? lat;
  // double? lon;
  Tags tags;
  // CenterPos? center;

  factory Element.fromJson(Map<String, dynamic> json) => Element(
    type: json["type"],
    id: json["id"],
    // lat: json["lat"]?.json["lat"].toDouble(),
    // lon: json["lon"]?.json["lon"].toDouble(),
    tags: Tags.fromJson(json["tags"]),
    // center: json["center"]?.CenterPos.fromJson(json["center"]),
  );
}

class CenterPos {
  CenterPos({
    required this.lat,
    required this.lon,
  });

  double lat;
  double lon;

  factory CenterPos.fromJson(Map<String, dynamic> json) => CenterPos(
    lat: json["lat"].toDouble(),
    lon: json["lon"].toDouble(),
  );
}

class Tags {
  Tags({
    required this.name,
    // required this.addrStreet,
    required this.addrCity,
    required this.addrFull,
  });

  String name;
  // String addrStreet;
  String? addrCity;
  String? addrFull;

  factory Tags.fromJson(Map<String, dynamic> json) => Tags(
    name: json["name"],
    // addrStreet: json["addr:street"],
    addrCity: json["addr:city"],
    addrFull: json["addr:full"],
  );
}
