import 'package:flutter/material.dart';
import 'package:senior/Screens/sign_in.dart';
import 'package:senior/Screens/sign_up.dart';


class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});
  @override
  State<WelcomePage> createState() => _WelcomePageState();
}
class _WelcomePageState extends State<WelcomePage> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 247, 206, 77),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 80),
              //PADDING FOR THE CONTAINER CONTENTS
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                //FILL THE MAX WIDTH
                children: [
                  Text(
                    'Welcome To..',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Image(
                    image: AssetImage('assets/p3.png'),
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                  Text(
                    'BKM Glasses!',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  ElevatedButton(
                    onPressed: () {Navigator.of(context).push(MaterialPageRoute
                      ( builder: (context)=> SignUpScreen()));},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 247, 206, 77),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 15), //HEIGHT FOR THE BUTTON
                    ),
                    child: Text(
                      'Get started',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
                color: Color.fromARGB(255, 247, 206, 77),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      textAlign:TextAlign.right,
                      style: TextStyle(fontSize: 14),
                    ),
                    GestureDetector(
                      onTap: (){Navigator.of(context).push(MaterialPageRoute
                        ( builder: (context)=> SignInScreen()));},
                      child: Text(
                        "Sign in",
                        textAlign:TextAlign.right,
                        style: TextStyle(fontSize: 14,color: Colors.white),
                      ),)
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}

