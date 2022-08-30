import 'package:flutter/material.dart';
import 'package:inf01043/screens/about/about_screen.dart';
import 'package:inf01043/screens/search/search_screen.dart';
import '../../components/home/category.dart';
import '../reader/reader_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  void _navigateToSearch(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return SearchScreen();
        },
      ),
    );
  }

  void _navigateToReader(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return ReaderScreen();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("IHC"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          SizedBox(
            height: 120,
            child: Image.asset(
              'assets/images/logo.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 54,
          ),
          Category(title: "Pesquisar", color: Colors.green, navigate: _navigateToSearch),
          Category(title: "Ler QR", color: Colors.red, navigate: _navigateToReader),
          Category(title: "Sobre", color: Colors.yellow, navigate: _navigateToAbout),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
    );
  }
}
