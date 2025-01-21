import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DisplayImages extends StatelessWidget {
  const DisplayImages({super.key});

  // Convert Base64 string to Uint8List
  Uint8List _base64ToImage(String base64String) {
    return base64Decode(base64String);
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    // If no user is logged in, show a message
    if (user == null) {
      return Center(child: Text("Please log in to view your photos."));
    }

    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('photos')
          .where('userId', isEqualTo: user.uid) // Filter by userId
          .orderBy('createdAt', descending: true)
          .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        // Show loading spinner if data is still being fetched
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        // Handle errors during data fetch
        if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        }

        // Check if the data is available
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(child: Text("No images found."));
        }

        final documents = snapshot.data!.docs;

        return GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 30),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Two columns
            crossAxisSpacing: 10, // Space between columns
            mainAxisSpacing: 10, // Space between rows
            childAspectRatio: 0.8, // Adjust card size
          ),
          itemCount: documents.length,
          itemBuilder: (context, index) {
            final data = documents[index];
            final base64String = data['image'];
            final description = data['description'];

            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Color.fromRGBO(252, 242, 211, 1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  // Outer Circular Container for the image
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: ClipOval(
                      child: Image.memory(
                        _base64ToImage(base64String),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      description,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  SizedBox(height: 8),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
