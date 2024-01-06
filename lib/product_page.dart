import 'dart:convert';

import 'package:api_example_70/product_data_model.dart';
import 'package:api_example_70/product_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as httpClient;

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  ProductDataModel? mData;

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: mData != null && mData!.products!.isNotEmpty
          ? ListView.builder(
              itemCount: mData!.products!.length,
              itemBuilder: (_, index) {
                var eachProduct = mData!.products![index];
                return Column(
                  children: [
                    ListTile(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailPage(mProduct: eachProduct),));
                      },
                      leading: Image.network(eachProduct.thumbnail ?? "", width: 70, height: 70,),
                      title: Text(eachProduct.title ?? ""),
                      subtitle: Text(eachProduct.description ?? ""),
                      trailing: Text('\$ ${eachProduct.price!.toString()}'),
                    ),
                    SizedBox(
                      height: 150,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: eachProduct.images!.length,
                          itemBuilder: (_, childIndex){
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(eachProduct.images![childIndex]),
                            );
                          }),
                    ),
                  ],
                );
              })
          : Container(
              child: Center(
                child: Text('No Products!!'),
              ),
            ),
    );
  }

  void getProducts() async {
    var uri = Uri.parse("https://dummyjson.com/products");
    var response = await httpClient.get(uri);

    print("Code: ${response.statusCode}");
    print("Response: ${response.body}");

    if (response.statusCode == 200) {
      var rawData = jsonDecode(response.body);
      mData = ProductDataModel.fromJson(rawData);
      setState(() {});
    }
  }
}
