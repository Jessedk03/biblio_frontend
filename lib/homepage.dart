import 'package:biblioapp/bottom_navbar.dart';
import 'package:biblioapp/custom_appbar.dart';
import 'package:biblioapp/list_view.dart';
// import 'package:biblioapp/services/api_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String bookUserName;

  @override
  void initState() {
    super.initState();
    bookUserName = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FancyAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(0),
            child: DecoratedBox(
              decoration: const BoxDecoration(
                color: Color.fromARGB(125, 130, 130, 130),
              ),
              child: Padding(
                padding: const EdgeInsets.all(7),
                child: TextField(
                  onSubmitted: (query) {
                    // final List<String> searchTerms = query.split(' ');
                    // final String title = searchTerms.join(' ');
                    // final String author =
                        // searchTerms.length > 1 ? searchTerms[1] : '';
                    // ApiService.searchBooks(title, author).then((books) {
                      // print(books);
                    // });
                  },
                  decoration: const InputDecoration(
                    hintText: "Zoek op titel of auteur..",
                    border: InputBorder.none,
                    icon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: DecoratedBox(
              decoration: const BoxDecoration(),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: BookListView(
                  onTitleChanged: (String userName) {
                    setState(
                      () {
                        bookUserName = userName;
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
