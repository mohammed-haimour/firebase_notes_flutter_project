import 'package:flutter/material.dart';
import 'package:notes_app_with_fire_base/core/entities/note_entity.dart';
import 'package:notes_app_with_fire_base/core/utils/constants/firebase_collictions.dart';
import 'package:notes_app_with_fire_base/features/notes/presentation/views/widgets/notes_list_view.dart';

class NotesStreamBuilder extends StatelessWidget {
  const NotesStreamBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: fireStoreNotesCollection.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<NoteEntity> notes = [];
          List<String> docs = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            notes.add(NoteEntity.fromJson(snapshot.data!.docs[i]));
            docs.add(snapshot.data!.docs[i].reference.id);
          }

          return NotesListView(
            notes: notes,
            docs: docs,
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("Somthing Wen't Wrong"),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
