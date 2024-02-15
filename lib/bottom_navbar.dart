import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0; 

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
      currentIndex: _selectedIndex, 
      onTap: (index) {
        setState(() {
          _selectedIndex = index; 
        });
        switch (index) {
          case 0:
            Navigator.pushReplacementNamed(context, '/'); 
            break;
          case 1:
            Navigator.pushReplacementNamed(context, '/create'); 
            break;
          case 2:
            Navigator.pushReplacementNamed(context, '/scanner'); 
            break;
        }
      },
    );
  }
}
