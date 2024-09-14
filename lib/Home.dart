import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:progreess_bar_flutter/Details.dart';

import 'name_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Product> products = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchProduct();
  }

  Future<void> fetchProduct() async {
    final response = await http.get(Uri.parse(
        'https://drive.google.com/uc?export=download&id=1m-lmKoCB7vDjKnZ8YHlLQj1WXxhaLpH4'));
    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);
      setState(() {
        products = jsonData.map((data) => Product.fromJson(data)).toList();
        isLoading = false;
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Model Classes'),
          centerTitle: true,
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
        ),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Details(
                                      product: products[index],
                                    )));
                      },
                      title: Text(products[index].name!),
                      subtitle: Text(products[index].bio!),
                      trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            products.removeAt(index);
                          });
                        },
                        icon: Icon(Icons.delete),
                      ),
                    ),
                  );
                }));
  }
}
