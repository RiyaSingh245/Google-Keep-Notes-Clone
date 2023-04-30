import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:keep_notes/Model/MyNoteModel.dart';
import 'package:keep_notes/Services/login_info.dart';

import 'db.dart';

class FireDB {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  createNewNoteFirestore(Note note, String id) async {
    LocalDataSaver.getSyncSet().then((isSyncOn) async {
      if (isSyncOn.toString() == "true") {
        final User? current_user = _auth.currentUser;
        await FirebaseFirestore.instance
            .collection("notes")
            .doc(current_user!.email)
            .collection("UserNotes")
            .doc(id)
            .set({
          "Title": note.title,
          "Content": note.content,
          "Date :": note.createdTime,
        }).then((_) {
          print("DATA ADDED SUCCESSFULLY");
        });
      }
    });
  }

  getAllStoredNotes() async {
    final User? current_user = _auth.currentUser;
    await FirebaseFirestore.instance
        .collection("notes")
        .doc(current_user!.email)
        .collection("UserNotes")
        .orderBy("Date")
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        Map note = result.data();

        NotesDatabse.instance.InsertEntry(Note(
            pin: false,
            isArchieve: false,
            title: note["Title"],
            content: note["Content"],
            createdTime: note["Date"]));
      });
    });
  }

  updateNoteFirestore(Note note) async {
    LocalDataSaver.getSyncSet().then((isSyncOn) async {
      print(isSyncOn);
      if (isSyncOn.toString() == "true") {
        final User? current_user = _auth.currentUser;
        await FirebaseFirestore.instance
            .collection("notes")
            .doc(current_user!.email)
            .collection("UserNotes")
            .doc(note.id.toString())
            .update({
          "Title": note.title.toString(),
          "Content": note.content,
        }).then((_) {
          print("DATA UPDATED SUCCESSFULLY");
        });
      }
    });
  }

  deleteNoteFirestore(Note note) async {
    LocalDataSaver.getSyncSet().then((isSyncOn) async {
      if (isSyncOn.toString() == "true") {
        final User? current_user = _auth.currentUser;
        await FirebaseFirestore.instance
            .collection("notes")
            .doc(current_user!.email)
            .collection("UserNotes")
            .doc(note.id.toString())
            .delete()
            .then((_) {
          print("DATA DELETED SUCCESSFULLY");
        });
      }
    });
  }
}
