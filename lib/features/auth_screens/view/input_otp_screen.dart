import 'package:flutter/material.dart';
import 'package:ichi/features/auth_screens/view/personali_information_screen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatelessWidget {
  final TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('אימות OTP'), // OTP Verification
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Instruction Text
            Text(
              'הזן את קוד ה-OTP שנשלח לטלפון שלך', // Enter the OTP sent to your phone
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            // OTP Input Fields
            PinCodeTextField(
              appContext: context,
              length: 6,
              controller: _otpController,
              keyboardType: TextInputType.number,
              onChanged: (value) {},
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 50,
                fieldWidth: 40,
                activeFillColor: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            // Verify OTP Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return PersonalInformationScreen();
                }));
                // Implement OTP verification logic
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
              child: Text('אמת קוד OTP'), // Verify OTP
            ),
            SizedBox(height: 10),
            // Resend OTP Link
            TextButton(
              onPressed: () {
                // Implement resend OTP logic
              },
              child: Text('שלח קוד OTP מחדש'), // Resend OTP
            ),
          ],
        ),
      ),
    );
  }
}
