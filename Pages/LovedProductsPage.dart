import 'package:flutter/material.dart';

class LovedProductsPage extends StatelessWidget {
  final List<Map<String, dynamic>> lovedProducts;

  const LovedProductsPage({super.key, required this.lovedProducts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4EDDD),
      appBar: AppBar(
        title: const Text("Loved Products"),
        centerTitle: true, 
        
backgroundColor: const Color(0xFFF4EDDD),    
  ),
  
      body: lovedProducts.isEmpty
          ? const Center(child: Text("No loved products"))
          : ListView.builder(
              itemCount: lovedProducts.length,
              itemBuilder: (context, index) {
                
                final product = lovedProducts[index];
                
                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.all(10),
                  
                  child: ListTile(
                    leading: Image.asset(product["image"]),
                    title: Text(product["name"]),
                    subtitle: Text("\$${product["price"]}"),
                    
                  ),
                );
              },
            ),
    );
  }
}
