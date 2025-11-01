
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getMessages() {
    return _db.collection('messages').orderBy('timestamp').snapshots();
  }

  Future<void> sendMessage(String text, String senderId) async {
    await _db.collection('messages').add({
      'text': text,
      'senderId': senderId,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }
}
