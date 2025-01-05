import 'package:flutter/material.dart';
import 'package:senior/Screens/HomeScreen.dart';

class NewMap extends StatefulWidget {
  const NewMap({super.key});

  @override
  State<NewMap> createState() => _NewMapState();
}

class _NewMapState extends State<NewMap> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 247, 206, 77),
        title: Text(
          'Maps',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
      body: Container(
        color: Color.fromARGB(255, 247, 206, 77),
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity, // Use full width
              child: Column(
                children: [
                  Image(
                    image: AssetImage('assets/p9.png'),
                    height: 140,
                    width: 140,
                  ),
                  Text(
                    'Add new map',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            // Adjusted Stack to position the button exactly at the top-left
            Stack(
              children: [
                Container(
                  width: double.infinity, // Full-width for the container
                  height: 427,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                  ),
                ),
                // Positioned the add button at the top-left corner
                Positioned(
                  top: 20,
                  left: 20,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    child: Container(
                      width: 160,
                      height: 160,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(247, 206, 77, 0.3),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Icon(
                        Icons.add_rounded,
                        size: 160,  // Adjusted size for better fit
                        color: Colors.black, // Icon color
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
