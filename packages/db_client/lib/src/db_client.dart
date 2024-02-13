import 'dart:developer';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:db_client/src/db_record.dart';
import 'package:http/http.dart' as http;

class DbClient {
  final FirebaseFirestore _firestore;

  DbClient({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  Future<String> add({
    required String collection,
    required Map<String, dynamic> data,
  }) async {
    try {
      final DocumentReference<Map<String, dynamic>> docRef =
          await _firestore.collection(collection).add(data);
      return docRef.id;
    } catch (e) {
      throw Exception('Error adding a document: $e');
    }
  }

  Future<List<DbRecord>> fetchAll({required String collections}) async {
    try {
      final collectionRef = _firestore.collection(collections);
      final documents = await collectionRef.get();
      return documents.docs
          .map((doc) => DbRecord(id: doc.id, data: doc.data()))
          .toList();
    } catch (e) {
      throw Exception('Error fetching a documents: $e');
    }
  }

  Future<List<DbRecord>> fetchAllBundle<T>(
      {required String collections, required String bundleUrl}) async {
    try {
      final response = await http.get(Uri.parse('$bundleUrl/$collections'));
      final buffer = Uint8List.fromList(response.body.codeUnits);
      final task = _firestore.loadBundle(buffer);
      task.stream.listen((event) {
        if (event.taskState == LoadBundleTaskState.success) {
          log('Bundle load successfully');
        }
      });
      await task.stream.last;
      final querySnap = _firestore
          .collection(collections)
          .get(const GetOptions(source: Source.cache));

      return querySnap.then((querySnap) {
        return querySnap.docs
            .map((doc) => DbRecord(id: doc.id, data: doc.data()))
            .toList();
      });
    } catch (e) {
      throw Exception('Error fetching a documents: $e');
    }
  }

  Stream<List<DbRecord>> streamAll({
    required String collection,
  }) {
    final colReference = _firestore.collection(collection);

    return colReference.snapshots().map((snapshots) {
      return snapshots.docs
          .map((doc) => DbRecord(id: doc.id, data: doc.data()))
          .toList();
    });
  }

  Stream<List<DbRecord>> streamAllBy(
      {required String collection,
      required String field,
      required String value}) {
    final colReference = _firestore.collection(collection);
    final query = colReference.where(field, isEqualTo: value);
    return query.snapshots().map((snapshots) {
      return snapshots.docs
          .map((doc) => DbRecord(id: doc.id, data: doc.data()))
          .toList();
    });
  }
}
