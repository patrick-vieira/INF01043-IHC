import 'package:flutter/material.dart';
import 'package:inf01043/models/product.dart';

import 'package:intl/intl.dart';

class ProductListItem extends StatelessWidget {
  const ProductListItem({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: ListTile(
        title: Text(
          style: Theme.of(context).textTheme.headline6,
          product.name,
        ),
        subtitle: Text(product.address),
        trailing: Container(
          height: 50,
          child: Column(
            children: [
              FittedBox(
                child: Text(
                  'R\$ ${product.price}',
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  DateFormat('d MMM y').format(product.lastDate),
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
