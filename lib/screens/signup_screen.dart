import 'package:flutter/material.dart';
import 'welcome_screen.dart'; // Import your WelcomeScreen

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _isPasswordVisible = false; // State variable for password visibility
  bool _isConfirmPasswordVisible = false; // State variable for confirm password visibility

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
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => WelcomeScreen()), // Navigate to WelcomeScreen
                                (Route<dynamic> route) => false, // Remove all previous routes
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Text(
                    'Register',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                      color: Color(0xFF132A13),
                    ),
                  ),
                  Text(
                    'Create with your new account',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      color: Color(0xFF132A13),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  _buildInputField('Full Name', screenWidth),
                  _buildInputField('Email', screenWidth),
                  _buildInputField('Password', screenWidth, isPassword: true),
                  _buildInputField('Confirm Password', screenWidth, isPassword: true, isConfirm: true),
                  SizedBox(height: screenHeight * 0.04),
                  SizedBox(
                    width: screenWidth * 0.9,
                    height: screenHeight * 0.07,
                    child: ElevatedButton(
                      onPressed: () {
                        // Sign Up action
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF3B8132),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color(0xFFCCE7C9),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 16,
                          color: Color(0xBF132A13),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: Text(
                          'Log In',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 16,
                            color: Color(0xFF326F2A),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(color: Colors.grey, thickness: 1),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'Or Continue with',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 14,
                            color: Color(0xFF132A13),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(color: Colors.grey, thickness: 1),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSocialIcon('assets/images/google_icon.png'),
                      SizedBox(width: 20),
                      _buildSocialIcon('assets/images/facebook_icon.png'),
                    ],
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
  Widget _buildInputField(String label, double screenWidth, {bool isPassword = false, bool isConfirm = false}) {
    final radius = screenWidth * 0.15;

    return Padding(
      padding: EdgeInsets.only(bottom: 15.0),
      child: TextField(
        obscureText: isPassword && !_isPasswordVisible,
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
          suffixIcon: isPassword || isConfirm
              ? IconButton(
            icon: Icon(
              isPassword ? _isPasswordVisible ? Icons.visibility : Icons.visibility_off :
              _isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
              color: Color(0xFF132A13),
            ),
            onPressed: () {
              setState(() {
                if (isPassword) {
                  _isPasswordVisible = !_isPasswordVisible;
                } else if (isConfirm) {
                  _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                }
              });
            },
          )
              : null,
        ),
      ),
    );
  }

  // Function to create social media icon buttons
  Widget _buildSocialIcon(String assetPath) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: 25,
      child: Image.asset(
        assetPath,
        width: 30,
        height: 30,
      ),
    );
  }
}
