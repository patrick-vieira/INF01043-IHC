import 'package:flutter/material.dart';
import 'package:inf01043/components/search/product_list_item.dart';

import '../../data/mock_data.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                color: Colors.green,
              ),
              Container(
                height: 487,
                child: ListView.builder(
                  itemCount: MOCK_PRODUCTS.length,
                  itemBuilder: (BuildContext context, int index) {
                    final product = MOCK_PRODUCTS[index];
                    return ProductListItem(
                      product: product,
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
