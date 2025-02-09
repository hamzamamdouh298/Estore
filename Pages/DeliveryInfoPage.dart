import 'package:flutter/material.dart';
import 'OrderConfirmationPage.dart'; // Import OrderConfirmationPage

class DeliveryInfoPage extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;
  final double totalPrice; // Add totalPrice as a parameter

  const DeliveryInfoPage({
    super.key,
    required this.cartItems,
    required this.totalPrice, // Pass totalPrice to the constructor
  });

  @override
  _DeliveryInfoPageState createState() => _DeliveryInfoPageState();
}

class _DeliveryInfoPageState extends State<DeliveryInfoPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _contactController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4EDDD),
      appBar: AppBar(
        title: const Text("Delivery Info"),
        centerTitle: true,
        backgroundColor: const Color(0xFFF4EDDD),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(
                  labelText: 'Address',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _contactController,
                decoration: const InputDecoration(
                  labelText: 'Contact Information',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your contact information';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Navigate to confirmation page and pass totalPrice
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrderConfirmationPage(
                          name: _nameController.text,
                          address: _addressController.text,
                          contact: _contactController.text,
                          totalPrice: widget.totalPrice, // Pass totalPrice here
                        ),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                backgroundColor:  const Color.fromARGB(255, 236, 215, 231),

                ),
                child: const Text("Confirm Order"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
