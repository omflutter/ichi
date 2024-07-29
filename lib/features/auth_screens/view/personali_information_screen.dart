import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:lottie/lottie.dart';

import '../../bottom_navigation_bar/view/bottom_navigation_bar_view.dart';

class PersonalInformationScreen extends StatefulWidget {
  @override
  _PersonalInformationScreenState createState() => _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  File? _image;
  DateTime? _selectedDate;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('מידע אישי'), // Personal Information
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Profile Picture
              GestureDetector(
                onTap: _pickImage,
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.grey[300],
                  backgroundImage: _image != null ? FileImage(_image!) : null,
                  child: _image == null
                      ? Icon(
                    Icons.camera_alt,
                    size: 50,
                    color: Colors.grey[700],
                  )
                      : null,
                ),
              ),
              SizedBox(height: 30),
              // First Name Input Field
              _buildTextField(
                controller: _firstNameController,
                hintText: 'שם פרטי', // First Name
                icon: Icons.person,
              ),
              SizedBox(height: 20),
              // Last Name Input Field
              _buildTextField(
                controller: _lastNameController,
                hintText: 'שם משפחה', // Last Name
                icon: Icons.person_outline,
              ),
              SizedBox(height: 20),
              // Date of Birth Input Field
              GestureDetector(
                onTap: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (picked != null && picked != _selectedDate) {
                    setState(() {
                      _selectedDate = picked;
                      _dateOfBirthController.text = DateFormat('yyyy-MM-dd').format(picked);
                    });
                  }
                },
                child: AbsorbPointer(
                  child: _buildTextField(
                    controller: _dateOfBirthController,
                    hintText: 'תאריך לידה', // Date of Birth
                    icon: Icons.calendar_today,
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Submit Button
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Center(
                        child: AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Lottie.asset(
                                'assets/images/donejson.json', // Add your Lottie animation file here
                                height: 150,
                              ),
                              SizedBox(height: 20),
                              Text(
                                'הפרופיל נוצר בהצלחה!', // Profile created successfully!
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF662D91),
                                ),
                              ),
                              SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop(); // Close the alert dialog
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(builder: (context) => HomeScreen()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Color(0xFF662D91),
                                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  textStyle: TextStyle(fontSize: 18),
                                ),
                                child: Text('המשך'), // Continue
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color(0xFF662D91),
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text('שלח'), // Submit
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build text fields
  Widget _buildTextField({required TextEditingController controller, required String hintText, required IconData icon}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(icon),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        ),
      ),
    );
  }
}

