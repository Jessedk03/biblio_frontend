import 'dart:async';
import 'package:biblioapp/bottom_navbar.dart';
import 'package:biblioapp/create_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:biblioapp/services/api_service.dart';

class ScannerPage extends StatefulWidget {
  const ScannerPage({Key? key});

  @override
  _ScannerPageState createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  String _scanBarcode = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;

    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);

      bool matchFound = await checkForMatch(barcodeScanRes);
      if (matchFound) {
        await showBookDialog(barcodeScanRes);
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CreateScreen(
              initialIsbnNumber: barcodeScanRes,
            ),
          ),
        );
      }
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  Future<bool> checkForMatch(String barcode) async {
    List<Map<String, dynamic>> books = await ApiService.fetchBooks();
    List<String> isbnNumbers =
        books.map((book) => book['isbnNumber']).toList().cast<String>();

    return isbnNumbers.contains(barcode);
  }

  Future<void> showBookDialog(String isbn) async {
    List<Map<String, dynamic>> books = await ApiService.fetchBooks();
    var book = books.firstWhere((element) => element['isbnNumber'] == isbn);
    var title = book['title'];
    var author = book['author'];
    var isbnNumber = book['isbnNumber'];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Book Details'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Title: $title'),
              Text('Author: $author'),
              Text('ISBN: $isbnNumber'),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 130, 130, 130),
        title: const Text(
          'Scan je boek!',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
              color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.popAndPushNamed(context, '/');
          },
        ),
      ),
      body: Builder(
        builder: (BuildContext context) {
          return Container(
            alignment: Alignment.center,
            child: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => scanBarcodeNormal(),
                  child: const Text('Start barcode scan'),
                ),
                Text('Scan result : $_scanBarcode\n',
                    style: const TextStyle(fontSize: 20))
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
