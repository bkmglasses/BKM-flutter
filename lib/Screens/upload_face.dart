import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UploadFace extends StatefulWidget {
  const UploadFace({super.key});

  @override
  State<UploadFace> createState() => _UploadFaceState();
}

class _UploadFaceState extends State<UploadFace> {
  final _descriptionController = TextEditingController();
  File? _image;

  // Method to pick an image from the gallery
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  // Convert the image file to a Base64 string
  Future<String> _imageToBase64(File image) async {
    final bytes = await image.readAsBytes();
    return base64Encode(bytes);
  }

  // Upload the image to Firestore
  Future<void> _uploadImageToDatabase() async {
    if (_image == null || _descriptionController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select an image and provide a description')),
      );
      return;
    }

    try {
      // Get the userId of the currently signed-in user
      String userId = FirebaseAuth.instance.currentUser!.uid;

      // Convert the image to Base64
      final base64Image = await _imageToBase64(_image!);

      // Save the image and description to Firestore
      await FirebaseFirestore.instance.collection('photos').add({
        'image': base64Image,
        'description': _descriptionController.text.trim(),
        'userId': userId, // Store userId to associate with the uploaded image
        'createdAt': Timestamp.now(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Image uploaded successfully')),
      );

      setState(() {
        _image = null;
        _descriptionController.clear();
      });

      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Upload failed: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 247, 206, 77),
        title: Text('Upload Image'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 6),
            _image == null
                ? Text("No image selected", style: TextStyle(fontSize: 12))
                : Image.file(_image!, height: 160),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: "Description"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text("Pick Image", style: TextStyle(color: Colors.black)),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Color.fromARGB(255, 247, 206, 77),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _uploadImageToDatabase,
              child: Text("Upload", style: TextStyle(color: Colors.black)),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Color.fromARGB(255, 247, 206, 77),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
