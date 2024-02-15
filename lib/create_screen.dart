import 'package:biblioapp/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:biblioapp/services/api_service.dart';

class CreateScreen extends StatefulWidget {
  final String? initialIsbnNumber;

  const CreateScreen({Key? key, this.initialIsbnNumber}) : super(key: key);

  @override
  _CreateScreenState createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();
  final TextEditingController _isbnController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _isbnController.text = widget.initialIsbnNumber ?? '';
  }

  void _createBook() async {
    String title = _titleController.text;
    String author = _authorController.text;
    String isbnNumber = _isbnController.text;
    String userName = "";

    try {
      ApiService apiService = ApiService();

      await apiService.createBook(title, author, isbnNumber, userName);

      _titleController.clear();
      _authorController.clear();
      _isbnController.clear();
    } catch (error) {
      print('Error creating book: $error');
    }
  }

  Future openDialog() async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Boek succesvol aangemaakt'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              "Okay",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.popAndPushNamed(context, '/');
          },
        ),
        backgroundColor: const Color.fromARGB(255, 130, 130, 130),
        title: const Text(
          'Voeg je boek handmatig toe!',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
              color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Titel'),
            ),
            TextField(
              controller: _authorController,
              decoration: const InputDecoration(labelText: 'Auteur'),
            ),
            TextField(
              controller: _isbnController,
              decoration: const InputDecoration(labelText: 'ISBN Nummer'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade300,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                _createBook();
                openDialog();
              },
              child: const Text(
                'Create Book',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
