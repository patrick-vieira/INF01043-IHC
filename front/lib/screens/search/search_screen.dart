import 'package:flutter/material.dart';
import 'package:inf01043/components/search/product_list_item.dart';
import 'package:inf01043/components/search/search_form.dart';

import '../../components/search/product_list.dart';
import '../../data/mock_data.dart';
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
    _searchProduct(searchTerm) {
      var filteredProducts = MOCK_PRODUCTS.where(
              (product) {
            return product.name.toLowerCase().contains(searchTerm);
          }).toList();
      setState(() {
        products = filteredProducts;
      });
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
                height: 487 - MediaQuery
                    .of(context)
                    .viewInsets
                    .bottom,
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
