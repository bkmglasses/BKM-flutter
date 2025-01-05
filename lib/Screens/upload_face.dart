import 'dart:convert';
import 'dart:typed_data';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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

  // Upload the image as a Base64 string to Firestore
  Future<void> _uploadImageToDatabase() async {
    if (_image == null || _descriptionController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select an image and provide a description')),
      );
      return;
    }

    try {
      // Convert the image to Base64
      final base64Image = await _imageToBase64(_image!);

      // Save the Base64 string and description to Firestore
      await FirebaseFirestore.instance.collection('photos').add({
        'image': base64Image,
        'description': _descriptionController.text.trim(),
        'createdAt': Timestamp.now(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Image uploaded successfully')),
      );

      // Clear state
      setState(() {
        _image = null;
        _descriptionController.clear();
      });

      Navigator.pop(context);
    } catch (e) {
      print('Error uploading image: $e');
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
        title: Text(
          'Upload Image',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
          ),
        ),
      ),
      body: Column(
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
    );
  }
}

class DisplayImages extends StatelessWidget {
  const DisplayImages({super.key});

  // Convert Base64 string to Uint8List
  Uint8List _base64ToImage(String base64String) {
    return base64Decode(base64String);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 247, 206, 77),
        title: Text(
          'View Images',
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('photos').orderBy('createdAt', descending: true).snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final documents = snapshot.data!.docs;

          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (context, index) {
              final data = documents[index];
              final base64String = data['image'];
              final description = data['description'];

              return Card(
                child: Column(
                  children: [
                    Image.memory(
                      _base64ToImage(base64String),
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        description,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}