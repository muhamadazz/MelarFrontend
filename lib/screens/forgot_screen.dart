import 'package:flutter/material.dart';
import 'verifyEmail_screen.dart'; // Import VerifyEmailScreen

class ForgotScreen extends StatefulWidget {
  @override
  _ForgotScreenState createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Opacity(
            opacity: 0.5,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: screenHeight * 0.05),
                  Align(
                    alignment: Alignment.topLeft,
                    child: CircleAvatar(
                      backgroundColor: Color(0x5A46932C),
                      child: IconButton(
                        icon: Icon(Icons.arrow_back, color: Color(0xFF132A13)),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Text(
                    'Forgot Password',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                      color: Color(0xFF132A13),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  CircleAvatar(
                    radius: 90,
                    backgroundColor: Color(0xFFC2D4BF),
                    child: Image.asset(
                      'assets/images/forgot.png',
                      width: 90,
                      height: 90,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    'Please Enter Your Email Address To Receive a Verification Message',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      color: Color(0xFF132A13),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeight * 0.1),
                  _buildInputField('Email Address', screenWidth),
                  SizedBox(height: screenHeight * 0.1),
                  SizedBox(
                    width: screenWidth * 0.9,
                    height: screenHeight * 0.07,
                    child: ElevatedButton(
                      onPressed: () {
                        _sendEmail(_emailController.text);
                        // Navigate to VerifyEmailScreen with the email
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VerifyEmailScreen(
                              email: _emailController.text,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF3B8132),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Send',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Function to create input fields
  Widget _buildInputField(String label, double screenWidth) {
    final radius = screenWidth * 0.15;

    return Padding(
      padding: EdgeInsets.only(bottom: 15.0),
      child: TextField(
        controller: _emailController,
        decoration: InputDecoration(
          hintText: label,
          hintStyle: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 16,
            color: Color(0xBF132A13),
          ),
          filled: true,
          fillColor: Color(0xFF46932C).withOpacity(0.35),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF46932C), width: 1.0),
            borderRadius: BorderRadius.circular(radius),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF46932C), width: 2.0),
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
      ),
    );
  }

  // Placeholder function for sending email
  void _sendEmail(String email) {
    print('Send verification email to $email');
  }
}