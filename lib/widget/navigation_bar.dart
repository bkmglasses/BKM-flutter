import 'package:flutter/material.dart';
import 'package:senior/Screens/HomeScreen.dart';
import 'package:senior/Screens/about_us.dart';

import '../Screens/profile.dart';

class navigation_bar extends StatelessWidget {
  const navigation_bar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
          onTap: (index) {
            switch (index) {
              case 0:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutUs()),
                );
                break;
              case 1:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
                break;
              case 2:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Profile()),
                );
                break;
            }
          },
          items:[
            BottomNavigationBarItem(icon:Icon(Icons.info_rounded,color: Colors.white,),label: ''),
            BottomNavigationBarItem(icon:Icon(Icons.home,color: Colors.white),label: ''),
            BottomNavigationBarItem(icon:Icon(Icons.person,color: Colors.white),label: ''),
          ],
          backgroundColor: Color.fromRGBO(247, 206, 77, 1),
          iconSize: 40,
        );
  }
}
