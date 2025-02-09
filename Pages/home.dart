import 'package:flutter/material.dart';
import 'cart.dart'; // Assuming CartPage is another screen.
import 'LovedProductsPage.dart'; // New file for loved products page
import 'product_details.dart'; // Import the product details page

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<Map<String, dynamic>> cartItems = [];
  List<Map<String, dynamic>> lovedProducts = [];

  final List<Map<String, dynamic>> products = [
    {
      "name": "Iphone 15",
      "description": "High-quality smartphone with excellent features.",
      "price": 800,
      "rating": 4.5,
      "image": "assets/images/1p.png",
    },
    {
      "name": "Laptop",
      "description": "Lightweight laptop with powerful performance.",
      "price": 999,
      "rating": 4.8,
      "image": "assets/images/1l.png",
    },
    {
      "name": "Smartwatch",
      "description": "Stylish smartwatch with fitness tracking.",
      "price": 199,
      "rating": 4.3,
      "image": "assets/images/1s.jpg",
    },
    {
      "name": "Headphones",
      "description": "Noise-cancelling wireless headphones.",
      "price": 149,
      "rating": 4.6,
      "image": "assets/images/1h.png",
    },
    {
      "name": "Tablet",
      "description": "Portable tablet for on-the-go productivity.",
      "price": 499,
      "rating": 4.4,
      "image": "assets/images/1t.jpg",
    },
    {
      "name": "Iphone 16",
      "description": "High-quality smartphone with excellent features.",
      "price": 1100,
      "rating": 4.5,
      "image": "assets/images/3p.png",
    },
    {
      "name": "PC case ATX",
      "description": "High-quality smartphone with excellent features.",
      "price": 2300,
      "rating": 4.2,
      "image": "assets/images/1pc.png",
    },
    {
      "name": "PC monitor Len",
      "description": "High-quality smartphone with excellent features.",
      "price": 2000,
      "rating": 4.3,
      "image": "assets/images/1m.png",
    },
    {
      "name": "PC keyboard 60%",
      "description": "High-quality keyboard with excellent features.",
      "price": 360,
      "rating": 4.5,
      "image": "assets/images/1k.png",
    },
    {
      "name": "PC mouse gaming",
      "description": "High-quality keyboard with excellent features.",
      "price": 70,
      "rating": 4.2,
      "image": "assets/images/1mo.png",
    },
    {
      "name": "PC MK Keyboard",
      "description": "High-quality keyboard with excellent features.",
      "price": 75,
      "rating": 4.5,
      "image": "assets/images/2k.png",
    },
    {
      "name": "PC gaming",
      "description": "High-quality with excellent features.",
      "price": 2499,
      "rating": 4.5,
      "image": "assets/images/2pc.png",
    },
  ];

  List<Map<String, dynamic>> filteredProducts = [];
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredProducts = List.from(products); // Initialize with all products
    searchController
        .addListener(_filterProducts); // Add listener to searchController
  }

  @override
  void dispose() {
    searchController.removeListener(_filterProducts);
    searchController.dispose();
    super.dispose();
  }

  void _filterProducts() {
    setState(() {
      final query = searchController.text.toLowerCase();
      if (query.isEmpty) {
        filteredProducts = List.from(products);
      } else {
        filteredProducts = products.where((product) {
          return product["name"].toLowerCase().contains(query);
        }).toList();
      }
    });
  }

  void addToCart(Map<String, dynamic> product) {
    setState(() {
      final existingProductIndex =
          cartItems.indexWhere((item) => item["name"] == product["name"]);
      if (existingProductIndex == -1) {
        cartItems.add({...product, "quantity": 1});
      } else {
        cartItems[existingProductIndex]["quantity"]++;
      }
    });
  }

  void toggleLoveProduct(Map<String, dynamic> product) {
    setState(() {
      final isAlreadyLoved =
          lovedProducts.any((item) => item["name"] == product["name"]);

      if (isAlreadyLoved) {
        lovedProducts.removeWhere((item) => item["name"] == product["name"]);
      } else {
        lovedProducts.add(product);
      }
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LovedProductsPage(lovedProducts: lovedProducts),
        ),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CartPage(cartItems: cartItems),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFFF4EDDD), // Set background color to #f4eddd
      appBar: AppBar(
        title: const Text("Products"),

        centerTitle: true,
        backgroundColor:
            const Color.fromARGB(100, 231, 201, 198), // شفافية 100 من 255
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: "Search products...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.blueAccent),
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.75,
              ),
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final product = filteredProducts[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductDetailsPage(product: product),
                      ),
                    );
                  },
                  child: Card(
                    color: const Color(0xFFF4EDDD),
                    elevation: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Image.asset(
                            product["image"],
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product["name"],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "\$${product["price"]}",
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.add_shopping_cart),
                                    onPressed: () => addToCart(product),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      lovedProducts.any((item) =>
                                              item["name"] == product["name"])
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: lovedProducts.any((item) =>
                                              item["name"] == product["name"])
                                          ? Colors.red
                                          : null,
                                    ),
                                    onPressed: () => toggleLoveProduct(product),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Loved",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
        ],
      ),
    );
  }
}
