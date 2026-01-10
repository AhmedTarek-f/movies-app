import 'package:injectable/injectable.dart';
import 'package:objectbox/objectbox.dart';

@LazySingleton()
class ObjectBoxStorage {
  final Store _store;

  ObjectBoxStorage(this._store);

  /// Access store if needed
  Store get store => _store;

  /// Get Box for Entity
  Box<T> getBox<T>() => _store.box<T>();

  /// Insert / Update entity
  int put<T>(T entity) => getBox<T>().put(entity);

  /// Get all entities
  List<T> getAll<T>() => getBox<T>().getAll();

  /// Delete entity by ID
  bool delete<T>(int id) => getBox<T>().remove(id);

  /// Clear all entities of type T
  int clear<T>() => getBox<T>().removeAll();

  /// Query entities
  List<T> query<T>(Condition<T> condition) {
    final query = getBox<T>().query(condition).build();
    final results = query.find();
    query.close();
    return results;
  }
}
