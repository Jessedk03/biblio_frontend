import 'package:flutter/material.dart';
import 'package:biblioapp/main.dart';
import 'package:biblioapp/scanner_screen.dart';
import 'package:biblioapp/create_screen.dart';
import 'package:biblioapp/homepage.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0; // Track the selected index

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: 'Create',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.qr_code),
          label: 'Scanner',
        ),
      ],
      currentIndex: _selectedIndex, // Set the current index
      onTap: (index) {
        setState(() {
          _selectedIndex = index; // Update the selected index
        });
        switch (index) {
          case 0:
            Navigator.pushReplacementNamed(context, '/'); // Navigate to homepage
            break;
          case 1:
            Navigator.pushReplacementNamed(context, '/create'); // Navigate to create page
            break;
          case 2:
            Navigator.pushReplacementNamed(context, '/scanner'); // Navigate to scanner page
            break;
        }
      },
    );
  }
}
