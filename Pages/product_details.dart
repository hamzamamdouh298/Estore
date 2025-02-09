import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  final Map<String, dynamic> product;  // Accepting product data

  const ProductDetailsPage({super.key, required this.product});  // Constructor to pass product data

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4EDDD),
      appBar: AppBar(
        title: Text(product["name"]),  // Displaying product name
        centerTitle: true, 
       backgroundColor: const Color.fromARGB(100, 231, 201, 198), // شفافية 100 من 255
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Displaying the product image
              Center(
                child: Image.asset(
                  product["image"],
                  fit: BoxFit.cover,
                  height: 200,
                ),
              ),
              const SizedBox(height: 16),
              // Product name
              Text(
                product["name"],
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              // Product price
              Text(
                "\$${product["price"]}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 16),
              // Product description
              const Text(
                "Description:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                product["description"],
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 16),
              // Product rating
              Row(
                children: [
                  const Text(
                    "Rating:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Row(
                    children: List.generate(
                      5,
                      (index) => Icon(
                        index < product["rating"].toInt()
                            ? Icons.star
                            : Icons.star_border,
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "(${product["rating"]})",
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
