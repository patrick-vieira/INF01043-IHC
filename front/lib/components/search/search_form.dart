import 'package:flutter/material.dart';

class SearchForm extends StatefulWidget {
  SearchForm({Key? key, required this.onSubmit}) : super(key: key);

  final void Function(String) onSubmit;

  @override
  State<SearchForm> createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  final _searchFieldController = TextEditingController();

  void submitForm() {
    final String searchText = _searchFieldController.text;

    if (searchText.isNotEmpty) {
      widget.onSubmit(searchText);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _searchFieldController,
                onSubmitted: (_) => submitForm(),
                decoration: const InputDecoration(labelText: 'Pesquisar produto'),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: IconButton(
                onPressed: () { submitForm(); },
                color: Colors.green,
                icon: const Icon(Icons.search),
              ),
            ),
          )
        ],
      ),
    );
  }
}
