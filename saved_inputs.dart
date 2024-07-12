import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserCredential {
  String? name;
  String? email;
  String? password;
  String? fieldOfStudy;
  DateTime? dateOfBirth;
  String? imagePath;
  String? gender;

  UserCredential(
      {this.name,
      this.email,
      this.password,
      this.fieldOfStudy,
      this.dateOfBirth,
      this.imagePath,
      this.gender});

  Future<void> saveCredentials() async // will save user credentials,
  //using shredpreferences.getInstance() method to get an intance

  {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name ?? '');
    await prefs.setString('email', email ?? '');
    await prefs.setString('password', password ?? '');
    await prefs.setString('fieldOfStudy', fieldOfStudy ?? '');
    if (dateOfBirth != null) {
      await prefs.setString('dateOfBirth', dateOfBirth!.toIso8601String());
    }
    // await prefs.setString('imagePath', imagePath ?? '');
    await prefs.setString('gender', gender ?? '');
  }

  Future<void> loadCredentials() async //loads saved user credentials
  {
    final prefs = await SharedPreferences.getInstance();
    name = prefs.getString('name') ?? '';
    email = prefs.getString('email') ?? '';
    password = prefs.getString('password') ?? '';
    fieldOfStudy = prefs.getString('fieldOfStudy') ?? '';
    final dobString = prefs.getString('dateOfBirth');
    dateOfBirth = dobString != null
        ? DateTime.parse(dobString)
        : null; // Load date of birth
    //  imagePath = prefs.getString('imagePath') ?? '';
    gender = prefs.getString('gender') ?? '';
  }
}

class UserCredentialScreen extends StatelessWidget {
  final UserCredential userCredential;

  const UserCredentialScreen({super.key, required this.userCredential});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Credentials'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Name: ${userCredential.name ?? 'N/A'}'),
            Text('Email: ${userCredential.email ?? 'N/A'}'),
            Text('Field of Study: ${userCredential.fieldOfStudy ?? 'N/A'}'),
            Text(
                'Date of Birth: ${userCredential.dateOfBirth != null ? DateFormat.yMd().format(userCredential.dateOfBirth!) : 'N/A'}'),
            Text('Gender: ${userCredential.gender ?? 'N/A'}'),
            const SizedBox(height: 20),
            userCredential.imagePath != null &&
                    userCredential.imagePath!.isNotEmpty
                ? Image.file(
                    File(userCredential.imagePath!),
                    height: 200,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
