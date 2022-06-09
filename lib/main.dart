import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bank_sampah/results.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'eWaste',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'eWaste'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.title,
              style: GoogleFonts.rokkitt(
                textStyle: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 60),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ResultsPage(title: "near you"),
                    ));
              },
              child: const Text(
                "Find waste banks near me",
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              "or",
              style: GoogleFonts.nunito(
                textStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 15),
            TextButton(
              onPressed: () {},
              child: const Text(
                "Pick a location",
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
