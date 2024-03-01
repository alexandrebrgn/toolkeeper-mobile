import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OwnBottomNavigationBar extends StatelessWidget{
  const OwnBottomNavigationBar({super.key, required List<dynamic> items});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        items: [
      const BottomNavigationBarItem(
          icon: Icon(Icons.fire_extinguisher),
          label: 'User'
      ),
    ]);
  }


}