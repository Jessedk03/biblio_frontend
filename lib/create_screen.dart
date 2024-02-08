import 'package:flutter/material.dart';
import 'package:biblioapp/bottom_navbar.dart';

void main() {
  runApp(const CreateScreen());
}

class CreateScreen extends StatelessWidget {
  const CreateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: ListView(
          children: [
            Create(),
          ],
        ),
        bottomNavigationBar: const BottomNavBar(), // Placing bottom navigation bar here
      ),
    );
  }
}

class Create extends StatelessWidget {
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
                left: screenWidth * 0.283,
                top: screenHeight * 0.1,
                child: Container(
                  width: screenWidth * 0.438,
                  height: screenHeight * 0.3,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  child: Icon(
                    Icons.add_a_photo,
                    size: screenWidth * 0.2,
                    color: Colors.black,
                  ),
                ),
              ),
              Positioned(
                left: screenWidth * 0.25,
                top: screenHeight * 0.471,
                child: Container(
                  width: screenWidth * 0.5,
                  height: screenHeight * 0.05,
                  decoration: ShapeDecoration(
                    color: Color(0xFFD9D9D9),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Titel',
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey),
                        contentPadding: EdgeInsets.all(0),
                      ),
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: screenWidth * 0.25,
                top: screenHeight * 0.544,
                child: Container(
                  width: screenWidth * 0.5,
                  height: screenHeight * 0.05,
                  decoration: ShapeDecoration(
                    color: Color(0xFFD9D9D9),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Auteur',
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey),
                        contentPadding: EdgeInsets.all(0),
                      ),
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: screenWidth * 0.283,
                top: screenHeight * 0.747,
                child: Container(
                  width: screenWidth * 0.438,
                  height: screenHeight * 0.068,
                  decoration: ShapeDecoration(
                    color: Color(0xFF00C02A),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: TextButton(
                    onPressed: () {
                      // Add onPressed functionality here
                    },
                    child: Text(
                      'opslaan',
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
              ),
            ],
          ),
        ),
      ],
    );
  }
}
