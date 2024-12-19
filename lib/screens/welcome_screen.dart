import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the dimensions of the screen
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Opacity(
            opacity: 0.8,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Main content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image.asset(
                      'assets/images/maskot.png',
                      width: 380,
                      height: 380,
                    ), // Mascot image
                    Container(
                      padding: EdgeInsets.only(bottom: 20), // Adjust padding as needed
                      child: Text(
                        'Hello!',
                        style: TextStyle(
                          fontFamily: 'Joan',
                          fontSize: 32,
                          color: Color(0xFF132A13).withOpacity(0.7),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 150),
                // Sign In button with adaptive size
                SizedBox(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.06,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Color(0xFF98BD84), // Text color for Sign In
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF46932C),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Create an Account button with adaptive size
                SizedBox(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.06,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: Text(
                      'Create an Account',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Color(0xFF46932C), // Text color for Create an Account
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Color(0x2646932C), // Background color with 15% opacity
                      side: BorderSide(color: Color(0xFF46932C), width: 2), // Border stroke
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
