import 'package:injectable/injectable.dart';
import 'package:movies_app/objectbox.g.dart';

@module
abstract class ObjectBoxModule {
  @preResolve
  Future<Store> get store async {
    return openStore();
  }
}
