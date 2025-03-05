import 'package:flutter/material.dart';

class MySearch extends StatefulWidget {
  final SearchController searchController = SearchController();
  MySearch(SearchController searchController, {super.key});

  @override
  State<MySearch> createState() => _MySearchState();
}

class _MySearchState extends State<MySearch> {
  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      builder: (context, searchController) {
        return SearchBar(
          controller: searchController,
          padding: const WidgetStatePropertyAll<EdgeInsets>(
            EdgeInsets.symmetric(horizontal: 16.0),
          ),
          onTap: () {
            searchController.openView();
          },
          onChanged: (_) {
            searchController.openView();
          },
        );
      },
      suggestionsBuilder: (context, searchController) {
        return List<ListTile>.generate(5, (int index) {
          final String item = 'item $index';
          return ListTile(
            title: Text(item),
            onTap: () {
              setState(() {
                searchController.closeView(item);
              });
            },
          );
        });
      },
    );
  }
}
