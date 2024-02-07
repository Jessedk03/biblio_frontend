import 'package:biblioapp/services/api_service.dart';
import 'package:flutter/material.dart';

class BookListView extends StatelessWidget {
  final ValueChanged<String> onTitleChanged;
  const BookListView({super.key, required this.onTitleChanged});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiService.fetchBooks(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<Map<String, dynamic>> bookData = snapshot.data ?? [];
          print('Number of cars: ${bookData.length}'); // Debugging statement
          return GridView.builder(
            padding: const EdgeInsets.all(2),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemCount: bookData.length,
            itemBuilder: (context, index) {
              final Map<String, dynamic> book = bookData[index];
              print('Car details: $book'); // Debugging statement
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DecoratedBox(
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: TextButton(
                        onPressed: () => openDialog(context, book),
                        child: Column(
                          children: [
                            Text('Title: ${book['title']}'),
                            Text('Author: ${book['author']}'),
                            Text('isbn: ${book['isbnNumber']}'),
                            Text(
                                'Gereserveerd: ${book['userName'] != null && book['userName'].isNotEmpty ? book['userName'] : 'Nee'}'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        }
      },
    );
  }

  Future openDialog(BuildContext context, Map<String, dynamic> book) async {
    TextEditingController userNameController = TextEditingController();

    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Reserveer: ${book['title']}'),
        content: TextField(
          controller: userNameController,
          decoration: const InputDecoration(hintText: "Volledige naam"),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              "Terug",
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ),
          TextButton(
            onPressed: () async {
              String userName = userNameController.text;
              await ApiService.updateBookUserName(book['id'], userName);
              onTitleChanged(userName); // Call onTitleChanged after the update
              // ignore: use_build_context_synchronously
              Navigator.of(context).pop();
            },
            child: const Text("Reserveer"),
          ),
        ],
      ),
    );
  }
}
