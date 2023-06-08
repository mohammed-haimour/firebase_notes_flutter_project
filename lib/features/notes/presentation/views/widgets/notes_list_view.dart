import 'package:flutter/material.dart';
import 'package:notes_app_with_fire_base/core/entities/note_entity.dart';
import 'package:notes_app_with_fire_base/core/utils/constants/firebase_auth_uid.dart';
import 'package:notes_app_with_fire_base/features/notes/presentation/views/widgets/notes_list_view_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key, required this.notes, required this.docs});
  final List<NoteEntity> notes;
  final List<String> docs;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return (notes[index].uid != uid)
              ? const SizedBox()
              : NotesListViewItem(note: notes[index] , doc : docs[index]);
        });
  }
}
