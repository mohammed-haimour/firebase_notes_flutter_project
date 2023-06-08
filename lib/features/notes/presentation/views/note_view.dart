import 'package:flutter/material.dart';
import 'package:notes_app_with_fire_base/core/entities/note_entity.dart';
import 'package:notes_app_with_fire_base/core/utils/constants/firebase_collictions.dart';
import 'package:notes_app_with_fire_base/core/utils/constants/navigators.dart';
import 'package:notes_app_with_fire_base/core/utils/widgets/custom_icon_btn.dart';
import 'package:notes_app_with_fire_base/features/notes/presentation/views/notes_view.dart';
import 'package:notes_app_with_fire_base/features/notes/presentation/views/widgets/note_view_body.dart';
import 'package:notes_app_with_fire_base/features/update_note/presentation/view/update_note_view.dart';

class NoteView extends StatelessWidget {
  const NoteView({super.key, required this.note, required this.docId});

  final NoteEntity note;
  final String docId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(note.noteTitle),
        actions: [
          CustomIconBtn(
            icon: Icons.delete,
            onPressed: () async {
              await fireStoreNotesCollection.doc(docId).delete().then((value) {
                replaceTo(context, const NotesView());
              });
            },
          ),
          const SizedBox(
            width: 10,
          ),
          CustomIconBtn(
            icon: Icons.edit,
            onPressed: () {
              goTo(
                  context,
                  UpdateNoteView(
                    docId: docId,
                    note: note,
                  ));
            },
          )
        ],
      ),
      body: NoteViewBody(
        note: note,
      ),
    );
  }
}
