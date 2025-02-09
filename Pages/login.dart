import 'package:flutter/material.dart';
import 'register.dart';
import 'home.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4EDDD),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo (GIF Image)
            const Image(
              image: AssetImage("assets/images/1.gif"),
              width: 300, // Adjust size as needed
              height: 250,
            ),

            const SizedBox(height: 5), // Small space between logo and form

            // Email text field
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Email",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black26),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Password text field
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black26),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),

            // Buttons Row (Sign In & Register side by side)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Sign-in button
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFDD2616), // Red color
                    foregroundColor: Colors.white, // Text color
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text("Sign In"),
                ),

                const SizedBox(width: 20), // Space between buttons

                // Register button
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const RegisterPage()),
                    );
                  },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF4EDDD), 
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(8),
                   side: const BorderSide(color: Colors.red, width: 2), // تحديد الإطار باللون الأحمر
  
                    ),
                  ),
                  child: const Text("Register"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
