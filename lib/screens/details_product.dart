import 'package:flutter/material.dart';
import 'package:abbey_road_store/models/product_entry.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductEntry product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "View Product: ${product.fields.name}",
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 29, 29, 29),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Name: ${product.fields.name}",
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(height: 8),
            Text(
              "Desc:\n${product.fields.description}",
              style: const TextStyle(color: Colors.black),
              softWrap:
                  true,
            ),
            const SizedBox(height: 12),
            Text(
              "Price: Rp ${product.fields.price}",
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 12),
            Text(
              "Stock Amount: ${product.fields.amount}",
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    const Color.fromARGB(255, 29, 29, 29), // Background color
                foregroundColor: Colors.white, // Font color
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 12.0), // Optional padding
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(8.0), // Optional rounded corners
                ),
              ),
              child: const Text("Back to Product List"),
            )
          ],
        ),
      ),
    );
  }
}