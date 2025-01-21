import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:senior/widget/display_faces.dart';
import 'package:senior/widget/navigation_bar.dart';
import '../widget/display_maps.dart';
import '../widget/sign_out_option.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String userName = ""; // Default placeholder for the user's name
  Widget selectedDisplay = const DisplayImages(); // Default widget to show faces
  bool isFacesSelected = true; // Flag to track which button is selected

  @override
  void initState() {
    super.initState();
    fetchUserName();
  }

  /// Fetches the signed-in user's name from Firestore
  Future<void> fetchUserName() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

        setState(() {
          userName = userDoc['name'] ?? 'User Name';
        });
      }
    } catch (e) {
      print("Error fetching user data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 247, 206, 77),
        title: Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        actions: [SignOutMenu()],
      ),
      body: Container(
        color: Color.fromARGB(255, 247, 206, 77),
        child: Column(
          children: [
            // User profile header
            Container(
              height: 150,
              width: double.infinity,
              child: Column(
                children: [
                  Image(
                    image: AssetImage('assets/p10.png'),
                    height: 100,
                    width: 100,
                  ),
                  Text(
                    userName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),
            // Buttons and face/map options
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 400,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 30, right: 35),
                  child: Container(
                    width: 360,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(250, 226, 151, 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // Faces button
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedDisplay = const DisplayImages();
                              isFacesSelected = true; // Faces selected
                            });
                          },
                          child: Text(
                            'Faces',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              isFacesSelected
                                  ? Color.fromRGBO(252, 242, 211, 1)
                                  :  Color.fromRGBO(250, 226, 151, 1.0),
                            ),
                          ),
                        ),
                        // Maps button
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedDisplay = const disMaps();
                              isFacesSelected = false; // Maps selected
                            });
                          },
                          child: Text(
                            'Maps',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              !isFacesSelected
                                  ?  Color.fromRGBO(252, 242, 211, 1)
                                  :  Color.fromRGBO(250, 226, 151, 1.0),
                            ),
                          ),
                        ),
                      ],
                    ),

                  ),
                ),
                // Display the selected widget
                Container(
                  padding: EdgeInsets.only(top:80),
                  height: 400,
                  child: selectedDisplay,
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: navigation_bar(),
    );
  }
}
