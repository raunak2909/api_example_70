import 'package:api_example_70/product_data_model.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  ProductModel mProduct;
  ProductDetailPage({required this.mProduct});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mProduct.title!),
      ),
      body: Column(
        children: [
          Image.network(mProduct.thumbnail!),
          Text(mProduct.description!)
        ],
      ),
    );
  }
}
