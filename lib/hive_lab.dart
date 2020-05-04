import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

const List<String> books = [
  'Harry Potter',
  'To Kill a Mockingbird',
  'The Hunger Games',
  'The Giver',
  'Brave New World',
  'Unwind',
  'World War Z',
  'The Lord of the Rings',
  'The Hobbit',
  'Moby Dick',
  'War and Peace',
  'Crime and Punishment',
  'The Adventures of Huckleberry Finn',
  'Catch-22',
  'The Sound and the Fury',
  'The Grapes of Wrath',
  'Heart of Darkness',
];

class HiveLabPage extends StatefulWidget {
  @override
  _HiveLabPageState createState() => _HiveLabPageState();
}

class _HiveLabPageState extends State<HiveLabPage> {
  Box<String> favoriteBooks;

  @override
  void initState() {
    super.initState();
    favoriteBooks = Hive.box('favorites');
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  Widget getIcon(int index) {
    if (favoriteBooks.containsKey(index)) {
      return Icon(Icons.favorite, color: Colors.red);
    }
    return Icon(Icons.favorite_border);
  }

  void onFavoritePress(int index) {
    if (favoriteBooks.containsKey(index)) {
      favoriteBooks.delete(index);
      return;
    }
    favoriteBooks.put(index, books[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ValueListenableBuilder(
          valueListenable: favoriteBooks.listenable(),
          builder: (context, box, _) => ListView.builder(
            itemCount: books.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(books[index]),
                trailing: IconButton(
                  icon: getIcon(index),
                  onPressed: () => onFavoritePress(index),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
