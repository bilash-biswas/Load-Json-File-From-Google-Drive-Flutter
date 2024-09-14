import 'package:flutter/material.dart';

import 'name_model.dart';

class Details extends StatelessWidget {
  final Product? product;

  const Details({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(product!.name ?? 'Customer Name'),
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
        ),
        body: Card(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.black26),
            child: Padding(
              padding: const EdgeInsets.all(11),
              child: Column(
                children: [
                  Text('Id : ${product!.id ?? 'Product Id'}'),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('Language : ${product!.language ?? 'Product Id'}'),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('Name : ${product!.name ?? 'Product Id'}'),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('Version : ${product!.version ?? 'Product Id'}'),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('Boi : ${product!.bio ?? 'Product Id'}'),
                ],
              ),
            ),
          ),
        ));
  }
}
