import 'package:flutter/material.dart';
import '../widget/navigation_bar.dart';
import '../widget/sign_out_option.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'About Us',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.black,
            ),
          ),
          backgroundColor: Color.fromARGB(255, 247, 206, 77),
          actions: [
            SignOutMenu(),
          ]
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          color: Colors.white,
          child: Column(
            children: [
              Image(
                image: AssetImage('assets/p4.jpeg'),
                height: 230,
                width: double.infinity,
                fit: BoxFit.contain,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'About Us',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Cras adipiscing enim eu turpis egestas. Tristique risus nec feugiat in fermentum. Lacinia at quis risus sed vulputate. Viverra ipsum nunc aliquet bibendum enim facilisis.',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.left,
              )
            ],
          ),
        ),
        bottomNavigationBar: navigation_bar(),
      ),
    );
  }
}
