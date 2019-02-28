import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

abstract class DataService<T> {
  Stream<T> getDataStream(String reference);
}

class FirestoreService extends DataService {
  final Firestore firestore;

  FirestoreService(this.firestore);

  @override
  Stream<QuerySnapshot> getDataStream(String reference) {
    return firestore.collection(reference).getDocuments().asStream();
  }
}
