import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:inf01043/components/search/search_form.dart';
import 'package:http/http.dart' as http;
import 'package:inf01043/constants.dart';

import '../../components/search/product_list.dart';
import '../../models/product.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Product> products = [];

  @override
  Widget build(BuildContext context) {
    _searchProduct(searchTerm) async {

      final queryParameters = {
        'search': searchTerm,
      };

      const token = "token";

      final uri = Uri.http(serverAddress, '/api/v1/search', queryParameters);
      final response = await http.get(uri, headers: {
        HttpHeaders.authorizationHeader: 'Token $token',
        HttpHeaders.contentTypeHeader: 'application/json',
      });

      List<Product> filteredProducts = [];

      if (response.statusCode == 200) {
        print(response.body);
        var j = jsonDecode(response.body);

        j.forEach((e) {
          var fields = e["fields"];
          Product p = Product(
            id: e["pk"],
            name: fields["name"],
            type: fields["type"],
            price: double.parse(fields["price"]),
            shop: fields["shop"],
            address: fields["address"],
            lastDate: DateTime.parse(fields["lastDate"]),
          );
          filteredProducts.add(p);
        });

        setState(() {
          products = filteredProducts;
        });
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Pesquisar")),
        ),
        body: Container(
          child: Column(
            children: [
              const SizedBox(
                height: 14,
              ),
              SizedBox(
                height: 100,
                child: Image.asset(
                  'assets/images/logo.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: 100,
                // color: Colors.green,
                child: SearchForm(
                  onSubmit: (s) {
                    _searchProduct(s);
                  },
                ),
              ),
              Container(
                height: 487 - MediaQuery.of(context).viewInsets.bottom,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProductList(products: products),
                ),
              ),
            ],
          ),
        ));
  }
}
