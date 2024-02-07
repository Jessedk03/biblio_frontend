import 'package:flutter/material.dart';

void main() {
  runApp(const FigmaToCodeApp());
}

class FigmaToCodeApp extends StatelessWidget {
  const FigmaToCodeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: ListView(children: [
          Iphone1415ProMax3(),
        ]),
      ),
    );
  }
}

class Iphone1415ProMax3 extends StatelessWidget {
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
                left: screenWidth * 0.139,
                top: screenHeight * 0.226,
                child: Text(
                  'Titel van het boek',
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
                left: screenWidth * 0.139,
                top: screenHeight * 0.484,
                child: Text(
                  'Naam van de persoon die reserveert',
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
