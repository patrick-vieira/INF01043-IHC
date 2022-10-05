import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:io';

import 'package:inf01043/screens/about/about_screen.dart';
import 'package:inf01043/screens/search/search_screen.dart';
import '../../components/home/category.dart';
import '../../constants.dart';
import '../reader/reader_screen.dart';

import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _navigateToSearch(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return SearchScreen();
        },
      ),
    );
  }

  void _navigateToAbout(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return AboutScreen();
        },
      ),
    );
  }

  Future<void> _navigateToReader(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ReaderScreen()),
    );

    // When a BuildContext is used from a StatefulWidget, the mounted property
    // must be checked after an asynchronous gap.
    if (!mounted) return;

    const token = "token";

    final uri = Uri.http(serverAddress, '/api/v1/new');
    final response = await http.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'url': result,
      }),
    );

    if (response.statusCode == 200) {
      print(response.body);
    }

    // After the Selection Screen returns a result, hide any previous snackbars
    // and show the new result.
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(
        content: Text(response.body),
        backgroundColor: Colors.green,
      ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 54,
          ),
          SizedBox(
            height: 120,
            child: Image.asset(
              'assets/images/logo.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          Category(title: "Pesquisar", color: Colors.green, navigate: _navigateToSearch),
          const SizedBox(
            height: 70,
          ),
          Category(title: "Ler QR", color: Colors.red, navigate: _navigateToReader),
          const SizedBox(
            height: 70,
          ),
          Category(title: "Sobre", color: Colors.yellow, navigate: _navigateToAbout),
        ],
      ),
    );
  }
}
