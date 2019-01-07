import 'package:redux_app/models/model.dart';
import 'package:redux_app/redux/actions.dart';

AppState appStateReducer(AppState state, action) {
  //return AppState();
  return AppState(items: itemReducer(state.items, action));
}

List<Item> itemReducer(List<Item> state, action) {
  if (action is AddItemAction) {
    // Cascade Notation (..) allows us to make a sequence of operations in the same object.
    return []
      ..addAll(state)
      ..add(Item(id: action.id, body: action.item));
  }
  if (action is RemoveItemAction) {
    return List.unmodifiable(List.from(state));
  }

  if (action is RemoveItemsAction) {
    return List.unmodifiable([]);
  }

  if (action is LoadedItemsAction) {
    return action.items;
  }
  return state;
}
