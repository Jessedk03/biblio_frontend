import 'package:biblioapp/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timezone/data/latest_10y.dart';
import 'package:timezone/timezone.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  String _formatDate(DateTime timestamp) {
    initializeTimeZones();

    final amsterdam = getLocation('Europe/Amsterdam');
    final amsterdamTime = TZDateTime.from(timestamp, amsterdam);
    return DateFormat('dd-MM-yyyy HH:mm').format(amsterdamTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 130, 130, 130),
        title: const Text(
          'Geschiedenis van reserveringen',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
              color: Colors.white),
        ),
      ),
      body: FutureBuilder(
        future: ApiService.fetchBooks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<Map<String, dynamic>> bookData = snapshot.data ?? [];
            print('Number of books: ${bookData.length}');

            bookData =
                bookData.where((book) => book['userName'] != null).toList();

            bookData.sort((a, b) => b['updated_at'].compareTo(a['updated_at']));

            return Material(
              child: ListView.builder(
                itemCount: bookData.length,
                itemBuilder: (context, index) {
                  final Map<String, dynamic> book = bookData[index];
                  return ListTile(
                    title: Text('Gebruiker: ${book['userName']}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Boek: ${book['title']}'),
                        Text(
                            'Gereserveerd op: ${_formatDate(DateTime.parse(book['updated_at']))}'),
                      ],
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
