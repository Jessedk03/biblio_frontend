import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'history_screen.dart';



class FancyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:const Color.fromARGB(255, 130, 130, 130), // Set your desired background color
      elevation: 0, // Remove shadow
      centerTitle: true,
      title: const Text(
        'Biblio',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.5,
          color: Colors.white
        ),
      ),
      actions: [
        IconButton(
          icon: SvgPicture.asset('assets/icons/history_icon.svg'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HistoryScreen()),
            );
          },
        ),
      ],
    );
  }
}
