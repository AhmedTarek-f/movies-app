import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@module
abstract class FirebaseFirestoreModule {
  @lazySingleton
  FirebaseFirestore get firestore => FirebaseFirestore.instance;
}
