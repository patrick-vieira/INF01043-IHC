import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category({Key? key, required this.title, required this.color, required this.navigate}) : super(key: key);

  final String title;
  final Color color;

  final void Function(BuildContext context) navigate ;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () => navigate(context),
          borderRadius: BorderRadius.circular(5),
          child: Container(
            width: 300,
            height: 60,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  color.withOpacity(0.5),
                  color,
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
                child: Text(
              title,
              style: Theme.of(context).textTheme.headline6,
            )),
          ),
        ),
      ],
    );
  }
}
