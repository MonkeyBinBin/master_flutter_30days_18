import 'package:flutter/material.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final List<String> _products = ['Product 1', 'Product 2', 'Product 3'];
  final List<String> _cart = [];

  void _addToCart(String product) {
    setState(() {
      _cart.add(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      body: ListView.builder(
          itemCount: _products.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                title: Text(_products[index]),
                trailing: ElevatedButton(
                  child: const Text('Add to Cart'),
                  onPressed: () => _addToCart(_products[index]),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/cart', arguments: _cart);
        },
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }
}
