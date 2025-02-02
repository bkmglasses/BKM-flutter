import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:senior/Screens/HomeScreen.dart';


class QRPage extends StatelessWidget {
  final String userId;

  // Constructor to accept userId
  QRPage({required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 206, 77),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QrImageView(data: userId, // The data to encode in the QR code
              version: QrVersions.auto, // Automatically select the QR code version
              size: 300.0, // Size of the QR code
              foregroundColor: Colors.black, // Color of the QR code
              backgroundColor: Color.fromARGB(255, 247, 206, 77),),
            SizedBox(height: 20),
            Text(
              "Scan this QR to verify your identity",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, // Background color
                foregroundColor: Color.fromARGB(255, 247, 206, 77), // Text color
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), // Button padding
                textStyle: TextStyle(
                  fontSize: 25, // Text size
                  fontWeight: FontWeight.bold, // Text weight
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), // Rounded corners
                ),
                elevation: 5, // Button shadow
              ),
              child: Text('Home'),
            ),
          ],
        ),
      ),
    );
  }
}