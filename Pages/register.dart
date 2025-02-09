import 'package:ec/Pages/home.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4EDDD),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            const Icon(
              Icons.person_add_alt_1_rounded,
              size: 72,
              color: Color.from(alpha: 1, red: 0.875, green: 0.165, blue: 0.114),
            ),
            const SizedBox(height: 25),

            // App slogan
            const Text(
              "SIGNUP",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            const SizedBox(height: 25),

            // Name text field
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Name",
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
            const SizedBox(height: 15),

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

            // Confirm password text field
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Confirm Password",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black26),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),

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
                      MaterialPageRoute(builder: (context) => const HomePage()),
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

            const SizedBox(height: 25),

            // Navigate back to login page
          
          ],
        ),
      ),
    );
  }
}
