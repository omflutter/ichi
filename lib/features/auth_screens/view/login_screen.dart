import 'package:flutter/material.dart';

import 'input_otp_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('התחברות'), // Login
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // App Logo
            Image.asset(
              'assets/images/balanceme.png',
              height: 150,
              width: 150,
            ),
            SizedBox(height: 30),
            // Phone number input field
            Container(
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
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: 'מספר טלפון', // Phone number
                  prefixIcon: Icon(Icons.phone),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Login button
            ElevatedButton(
              onPressed: () {
                // Implement OTP verification logic
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => OtpScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Color(0xFF662D91),
                padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                textStyle: TextStyle(fontSize: 18,color: Colors.yellow),
              ),
              child: Text('קבל קוד OTP'), // Get OTP
            ),
            SizedBox(height: 10),
            // Forgot password link
            TextButton(
              onPressed: () {
                // Implement forgot password logic
              },
              child: Text('שכחת סיסמה?'), // Forgot password?
            ),
            SizedBox(height: 20),
            // Or divider
            Row(
              children: <Widget>[
                Expanded(
                  child: Divider(
                    color: Colors.black,
                    height: 10,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text('או', style: TextStyle(fontSize: 16)), // Or
                ),
                Expanded(
                  child: Divider(
                    color: Colors.black,
                    height: 10,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Sign up link
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('אין לך חשבון? '), // Don't have an account?
                TextButton(
                  onPressed: () {
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(builder: (context) => RegistrationScreen()),
                    // );
                  },
                  child: Text(
                    'הירשם כאן', // Register here
                    style: TextStyle(
                      color: Color(0xFF662D91),
                      fontWeight: FontWeight.bold,
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