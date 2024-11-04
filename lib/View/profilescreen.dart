// profile_screen.dart
import 'package:apnu_umreth/Controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _imageFile;

  @override
  Widget build(BuildContext context) {
    final themeController = Provider.of<ThemeController>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: () {
              themeController.toggleTheme();
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundImage: _imageFile != null
                  ? FileImage(_imageFile!)
                  : AssetImage('assets/profile_icon.png') as ImageProvider,
              child: _imageFile == null
                  ? Icon(Icons.person, size: 50, color: Colors.white)
                  : null,
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {
              _showAddContentOptions(context);
            },
            icon: Icon(Icons.add),
            label: Text("Add Content"),
          ),
          SizedBox(height: 30),
          Center(
            child: Text(
              'Welcome to the Profile Screen',
              style: TextStyle(
                  color: themeController.themeData.brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  void _showAddContentOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.description),
              title: Text('Add Content'),
              onTap: () {
                Navigator.pop(context);
                _showAddTextContentDialog();
              },
            ),
          ],
        );
      },
    );
  }

  void _showAddTextContentDialog() {
    showDialog(
      context: context,
      builder: (context) {
        String content = '';
        return AlertDialog(
          title: Text('Add Content'),
          content: TextField(
            onChanged: (value) {
              content = value;
            },
            decoration: InputDecoration(hintText: "Enter content"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                print('Content added: $content');
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
