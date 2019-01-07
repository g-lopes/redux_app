import 'package:flutter/foundation.dart';

class Item {
  final int id;
  final String body;

  Item({@required this.id, @required this.body});

  Item copyWith({int id, String body}) {
    // expr1 ?? expr2 --> if expr1 is non-null return it. Otherwire return expr2.
    return Item(id: id ?? this.id, body: body ?? this.body);
  }

  // The part after : is called "initializer list.
  // It is a ,-separated list of expressions that can access constructor parameters
  // and can assign to instance fields, even final instance fields.
  // This is handy to initialize final fields with calculated values.
  Item.fromJson(Map json)
      : id = json['id'],
        body = json['body'];

  // Alternative syntax (syntax-suggar):
  // Map toJson() => {'id': (id as int), 'body': body};
  Map toJson() {
    return {'id': (id as int), 'body': body};
  }
}

class AppState {
  final List<Item> items;

  AppState({@required this.items});

  AppState.initialState() : items = List.unmodifiable(<Item>[]);

  AppState.fromJson(Map json)
      : items = (json['items'] as List).map((i) => Item.fromJson(i)).toList();

  Map toJson() => {'items': items};
}
