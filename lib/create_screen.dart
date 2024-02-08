import 'package:flutter/material.dart';

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
        body: ListView(children: [
          Iphone1415ProMax4(),
        ]),
      ),
    );
  }
}

class Iphone1415ProMax4 extends StatelessWidget {
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
                left: screenWidth * 0.072,
                top: screenHeight * 0.120,
                child: Container(
                  width: screenWidth * 0.856,
                  height: screenHeight * 0.727,
                  decoration: ShapeDecoration(
                    color: Color(0xFF777B7E),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                  ),
                ),
              ),
              Positioned(
                left: screenWidth * 0.180,
                top: screenHeight * 0.160,
                child: Container(
                  width: screenWidth * 0.640,
                  height: screenHeight * 0.218,
                  decoration: ShapeDecoration(
                    color: Color(0xFFD9D9D9),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                  ),
                ),
              ),
              Positioned(
                left: screenWidth * 0.349,
                top: screenHeight * 0.471,
                child: Text(
                  'Titel input field',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.045,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Positioned(
                left: screenWidth * 0.322,
                top: screenHeight * 0.544,
                child: Text(
                  'Auteur input field',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.045,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
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
                ),
              ),
              Positioned(
                left: screenWidth * 0.368,
                top: screenHeight * 0.769,
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
            ],
          ),
        ),
      ],
    );
  }
}
