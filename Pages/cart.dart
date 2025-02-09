import 'package:flutter/material.dart';
import 'DeliveryInfoPage.dart'; // Import DeliveryInfoPage

class CartPage extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;

  const CartPage({super.key, required this.cartItems});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late List<Map<String, dynamic>> cartItems;

  @override
  void initState() {
    super.initState();
    cartItems = List.from(widget.cartItems); // Make sure to copy the list
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice = cartItems.fold(
      0,
      (sum, item) => sum + item["price"] * item["quantity"],
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF4EDDD),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF4EDDD),
        title: const Text("My Cart"),
        centerTitle: true,
      ),
      body: cartItems.isEmpty
          ? const Center(
              child: Text(
                "Your cart is empty!",
                style: TextStyle(fontSize: 18),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return Card(
                        margin: const EdgeInsets.all(8.0),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(8.0),
                          leading: Image.asset(
                            item["image"],
                            fit: BoxFit.cover,
                            width: 50,
                            height: 50,
                          ),
                          title: Text(
                            item["name"],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.remove, color: Colors.red),
                                    onPressed: () {
                                      setState(() {
                                        if (item["quantity"] > 1) {
                                          item["quantity"]--;
                                        }
                                      });
                                    },
                                  ),
                                  Text(item["quantity"].toString()),
                                  IconButton(
                                    icon: const Icon(Icons.add, color: Colors.green),
                                    onPressed: () {
                                      setState(() {
                                        item["quantity"]++;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete, color: Colors.red),
                                onPressed: () {
                                  setState(() {
                                    cartItems.removeAt(index); // Remove item
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total: \$${totalPrice.toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to the delivery info page and pass totalPrice
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DeliveryInfoPage(
                                cartItems: cartItems,
                                totalPrice: totalPrice, // Pass totalPrice here
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          
                backgroundColor:  const Color.fromARGB(255, 236, 215, 231),
                        ),
                        child: const Text("Checkout"),
                        
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
