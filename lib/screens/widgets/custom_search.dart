import 'package:flutter/material.dart';
// import 'package:weather_app/screens/home_screen.dart/homepage_screen.dart';

class CustomSearch extends SearchDelegate<String> {
  final List<String> searchList = ['Lalitpur, London'];

//   void addDataToList() {
//   HomePage homePage = HomePage();
//   List<String> additionalData = homePage.; // Replace with your function call

//   // Concatenate the additional data to the searchList
//   searchList.addAll(additionalData);
// }

  // This method is responsible for building actions in appbar like clear btn
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = ''; // When pressed query will be cleared
        },
      ),
    ];
  }

  // This method is used to define leading icon or btn like back btn
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pop(); //Exit from search screen
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  // Used to display search results
  @override
  Widget buildResults(BuildContext context) {
    final List<String> searchResults = searchList
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(searchResults[index]),
          onTap: () {
            // Handle the selected search result.
            close(context, searchResults[index]);
          },
        );
      },
    );
  }

  // This is used to provide search suggestions
  @override
  Widget buildSuggestions(BuildContext context) {
    final List<String> suggestionList = query.isEmpty
        ? []
        : searchList
            .where((item) => item.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionList[index]),
          onTap: () {
            query = suggestionList[index];
            // Show the search results based on the selected suggestion.
          },
        );
      },
    );
  }
}
