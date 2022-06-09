import 'package:flutter/material.dart';

class ResultsPage extends StatefulWidget {
  const ResultsPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  double lat = -6.88;
  double lng = 107.61;

  void _getNearbyWasteBanks() {
    setState(() {
      //
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("n" + " waste banks " + widget.title),
      ),
      body: Container(),
    );
  }
}
