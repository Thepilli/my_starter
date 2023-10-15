import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
//get collettion
  final CollectionReference notes = FirebaseFirestore.instance.collection('notes');

//CREATE aka add a new item
  Future<void> addNote(String note) {
    return notes.add(
      {
        'note': note,
        'timestamp': Timestamp.now(),
      },
    );
  }

//READ aka get a given item
  Stream<QuerySnapshot> getNotesStream() {
    final notesStream = notes.orderBy('timestamp', descending: true).snapshots();
    return notesStream;
  }

//UPDATE aka change a given item
  Future<void> updateNote(String docID, String updatedNote) {
    return notes.doc(docID).update({
      'note': updatedNote,
      'timestamp': Timestamp.now(),
    });
  }

//DELETE aka remove a given item
  Future<void> deleteNote(String docID) {
    return notes.doc(docID).delete();
  }
}
