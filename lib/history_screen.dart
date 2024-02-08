import 'package:flutter/material.dart';
import 'package:biblioapp/bottom_navbar.dart';

void main() {
  runApp(const HistoryScreen());
}

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: ListView(
          children: [
            History(),
          ],
        ),
        bottomNavigationBar: const BottomNavBar(), // Placing bottom navigation bar here
      ),
    );
  }
}


class History extends StatelessWidget {
  // Mock data for demonstration
  final List<String> books = [
    'Book 1',
    'Book 2',
    'Book 3',
    // Add more book titles as needed
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Container(
          width: screenWidth,
          height: screenHeight,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: screenWidth,
                  height: screenHeight,
                  decoration: BoxDecoration(color: Colors.white),
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: screenWidth,
                  height: screenHeight * 0.089,
                  decoration: BoxDecoration(color: Color(0xFF777B7E)),
                ),
              ),
              Positioned(
                left: 0,
                top: screenHeight * 0.882,
                child: Container(
                  width: screenWidth,
                  height: screenHeight * 0.120,
                  decoration: BoxDecoration(color: Color(0xFF777B7E)),
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                child: SizedBox(
                  width: screenWidth,
                  height: screenHeight * 0.089,
                  child: Text(
                    'Biblio Scan app!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.045,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: screenWidth * 0.128,
                top: screenHeight * 0.208,
                child: SizedBox(
                  width: screenWidth * 0.767,
                  height: screenHeight * 0.045,
                  child: Text(
                    '\$naam reserveert \$title',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: screenWidth * 0.0225,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: screenWidth * 0.895,
                top: screenHeight * 0.242,
                child: Transform(
                  transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(-3.14),
                  child: Container(
                    width: screenWidth * 0.767,
                    height: screenHeight * 0.001,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: screenHeight * 0.089,
                child: Container(
                  width: screenWidth,
                  height: screenHeight * 0.087,
                  decoration: BoxDecoration(color: Color(0xFFD9D9D9)),
                ),
              ),
              Positioned(
                left: screenWidth * 0.128,
                top: screenHeight * 0.101,
                child: SizedBox(
                  width: screenWidth * 0.767,
                  height: screenHeight * 0.045,
                  child: Text(
                    'Geschiedenis',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: screenWidth * 0.0225,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: screenHeight * 0.200, // Adjust the top position as needed
                child: SizedBox(
                  width: screenWidth,
                  height: screenHeight * 0.7, // Adjust the height as needed
                  child: ListView.builder(
                    itemCount: books.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(books[index]),
                        // Add onTap functionality to navigate to book details screen
                        onTap: () {
                          // Add navigation logic here
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

