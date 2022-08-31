import 'package:flutter/material.dart';
import 'package:inf01043/models/product.dart';

import 'product_list_item.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key, required this.products}) : super(key: key);

  final List<Product> products;

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    if (widget.products.isEmpty) {
      return const SizedBox(
            height: 30,
            child: FittedBox(child: Icon(Icons.search))
          );
    } else {
      return ListView.builder(
            itemCount: widget.products.length,
            itemBuilder: (BuildContext context, int index) {
              final product = widget.products[index];
              return ProductListItem(
                product: product,
              );
            },
          );
    }
  }
}
