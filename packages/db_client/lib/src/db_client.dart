import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:db_client/src/db_record.dart';

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
}
