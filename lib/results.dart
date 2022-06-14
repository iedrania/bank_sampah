import 'package:bank_sampah/data/bs_overpass_data.dart';
import 'package:bank_sampah/data/bs_overpass_repo.dart';
import 'package:bank_sampah/result_map.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatefulWidget {
  const ResultsPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  // TODO: get location
  double lat = -6.88;
  double lng = 107.61;

  late Future<BsOverpassData> futureBsOverpassData;

  @override
  void initState() {
    super.initState();
    // TODO: bawah khatulistiwa, timur indo, (s, w, n, e), jarak 0.05
    String uri =
        'https://overpass-api.de/api/interpreter?data=[out:json][timeout:100];node[name~"[Bb]ank%20[Ss]ampah"](${lat - 0.05},${lng - 0.05},${lat + 0.05},${lng + 0.05});out;';
    // TODO: node to nwr
    // print(uri);
    futureBsOverpassData = fetchElements(uri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<BsOverpassData>(
        future: futureBsOverpassData,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!.elements.isNotEmpty) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
                    child: Text(snapshot.data!.elements.length.toString() +
                        " waste banks " +
                        widget.title)),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    itemCount: snapshot.data!.elements.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultMapPage(
                              title: snapshot.data!.elements[index].tags.name,
                              address: formulateAddress(
                                  snapshot.data!.elements[index].tags.addrFull,
                                  snapshot.data!.elements[index].tags
                                      .addrCity ??= ""),
                              lat: snapshot.data!.elements[index].lat,
                              lng: snapshot.data!.elements[index].lon),
                        ),
                      ),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 4,
                        margin: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(snapshot.data!.elements[index].tags.name),
                              const SizedBox(height: 4),
                              Text(
                                formulateAddress(
                                    snapshot
                                        .data!.elements[index].tags.addrFull,
                                    snapshot.data!.elements[index].tags
                                        .addrCity ??= ""),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            );
          } else if (snapshot.hasData && snapshot.data!.elements.isEmpty) {
            return const Center(
              child: Text("There are no waste banks nearby."),
            );
          } else if (snapshot.hasError) {
            // print("${snapshot.error}");
            return const Center(
              child:
                  Text("Oops! An error has occured. Please try again later."),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  String formulateAddress(String? addrFull, String? addrCity) {
    if (addrFull == null && addrCity == null) {
      return "-";
    } else if (addrFull == null || addrCity == null) {
      return (addrFull ?? "") + (addrCity ?? "");
    } else {
      return addrFull + ", " + addrCity;
    }
  }
}
