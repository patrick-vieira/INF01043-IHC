import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category({Key? key, required this.title, required this.color, required this.navigate}) : super(key: key);

  final String title;
  final Color color;

  final void Function(BuildContext context) navigate ;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navigate(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(15),
            width: 300,
            height: 80,
            margin: EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  color.withOpacity(0.5),
                  color,
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
                child: Text(
              title,
              style: Theme.of(context).textTheme.headline6,
            )),
          ),
        ],
      ),
    );
  }
}
