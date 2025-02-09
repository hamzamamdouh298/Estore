// ignore: file_names
import 'package:flutter/material.dart';
import 'home.dart'; // Import the home.dart file

class OrderConfirmationPage extends StatelessWidget {
  final String name;
  final String address;
  final String contact;
  final double totalPrice; // Add totalPrice as a parameter

  const OrderConfirmationPage({
    super.key,
    required this.name,
    required this.address,
    required this.contact,
    required this.totalPrice, // Receive totalPrice in the constructor
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4EDDD),
      appBar: AppBar(
        title: const Text("Order Confirmation"),
        centerTitle: true,
        backgroundColor: const Color(0xFFF4EDDD),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your order has been placed successfully!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text('Name: $name'),
            Text('Address: $address'),
            Text('Contact: $contact'),
            const SizedBox(height: 20),
            Text(
              'Total: \$${totalPrice.toStringAsFixed(2)}', // Display totalPrice here
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Your order will arrive in 2-3 hours.',
              style: TextStyle(fontSize: 20, color: Colors.green,),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Navigate to the home page using pushReplacement
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()), // HomePage is in home.dart
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:  const Color.fromARGB(255, 236, 215, 231),
              ),
              child: const Text("Go to Home"),
            ),
          ],
        ),
      ),
    );
  }
}
