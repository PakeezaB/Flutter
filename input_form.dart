import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; //provides utilities for date formating
import 'user_credential.dart';

class InputForm extends StatefulWidget {
  const InputForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<InputForm> {
  final _formKey = GlobalKey<FormState>();
  final _userCredential = UserCredential();
  final List<String> _fieldOfStudyOptions = [
    'Engineering',
    'Computer Science',
    'Mathematics',
    'Physics'
  ];
  String? _selectedFieldOfStudy;
  DateTime? _selectedDate;
  String? _selectedGender;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _userCredential.saveCredentials().then((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Credentials saved successfully!')),
        );
      }).catchError((error) {
        // ignore: avoid_print
        print('Error saving credentials: $error');
      });
    }
  }

  @override
  void initState() // will load previously saved user credentials
  {
    super.initState();
    _userCredential.loadCredentials().then((_) {
      setState(() {}); // will update UI after loading credentials
    }).catchError((error) {
      // ignore: avoid_print
      print('Error loading credentials: $error');
    });
  }

  void
      _goToUserCredentialScreen() //will navigate to userscrential screen passing user credentials
  {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            UserCredentialScreen(userCredential: _userCredential),
      ),
    );
  }

  Future<void> _selectDate(
      BuildContext context) async //displays date picker dialog.
  {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _userCredential.dateOfBirth = picked; // Update user credential
      });
    }
  }

  String _formatDate(DateTime? date) {
    return date != null ? DateFormat.yMd().format(date) : '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign-Up Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  initialValue: _userCredential.name ?? '',
                  decoration: const InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onChanged: (value) => _userCredential.name = value,
                ),
                TextFormField(
                  initialValue: _userCredential.email ?? '',
                  decoration: const InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                  onChanged: (value) => _userCredential.email = value,
                ),
                TextFormField(
                  initialValue: _userCredential.password ?? '',
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters long';
                    }
                    return null;
                  },
                  onChanged: (value) => _userCredential.password = value,
                ),
                DropdownButtonFormField<String>(
                  value: _selectedFieldOfStudy,
                  items: _fieldOfStudyOptions.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedFieldOfStudy = newValue;
                      _userCredential.fieldOfStudy =
                          newValue; // Update user credential
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: 'Field of Study',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () => _selectDate(context),
                  child: InputDecorator(
                    decoration: const InputDecoration(
                      labelText: 'Date of Birth',
                      border: OutlineInputBorder(),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          _selectedDate != null
                              ? _formatDate(_selectedDate)
                              : 'Select Date',
                        ),
                        const Icon(Icons.calendar_today),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text('Gender'),
                    RadioListTile<String>(
                      title: const Text('Female'),
                      value: 'Female',
                      groupValue: _selectedGender,
                      onChanged: (String? value) {
                        setState(() {
                          _selectedGender = value;
                          _userCredential.gender =
                              value; // Update user credential
                        });
                      },
                    ),
                    RadioListTile<String>(
                      title: const Text('Male'),
                      value: 'Male',
                      groupValue: _selectedGender,
                      onChanged: (String? value) {
                        setState(() {
                          _selectedGender = value;
                          _userCredential.gender =
                              value; // Update user credential
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text('Sign Up'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _goToUserCredentialScreen,
                  child: const Text('View User Credentials'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
