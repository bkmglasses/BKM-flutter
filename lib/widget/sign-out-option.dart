import 'package:flutter/material.dart';
import 'package:senior/services/authentication.dart';
import 'package:senior/Screens/sign_in.dart';

class SignOutMenu extends StatelessWidget {
  const SignOutMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Icon(Icons.more_vert),
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem<String>(
            value: 'signout',
            child: Text('Sign Out'),
          ),
        ];
      },
      onSelected: (value) async {
        if (value == 'signout') {
          await AuthMethod().signOut(); // Clears authentication
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => SignInScreen()),
                (Route<dynamic> route) => false,
          );
        }
      },
    );
  }
}
