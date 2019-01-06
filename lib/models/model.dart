import 'package:flutter/foundation.dart';

class Item {
  final int id;
  final String body;

  Item({@required this.id, @required this.body});

  Item copyWith({int id, String body}) {
    // expr1 ?? expr2 --> if expr1 is non-null return it. Otherwire return expr2.
    return Item(id: id ?? this.id, body: body ?? this.body);
  }
}

class AppState {
  final List<Item> items;

  AppState({@required this.items});

  AppState.initialState() : items = List.unmodifiable(<Item>[]);
}
