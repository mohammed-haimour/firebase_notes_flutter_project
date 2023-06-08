import 'package:flutter/material.dart';
import 'package:notes_app_with_fire_base/core/entities/note_entity.dart';
import 'package:notes_app_with_fire_base/core/utils/constants/custom_colors.dart';
import 'package:notes_app_with_fire_base/core/utils/constants/navigators.dart';
import 'package:notes_app_with_fire_base/features/notes/presentation/views/note_view.dart';

class NotesListViewItem extends StatelessWidget {
  const NotesListViewItem({super.key, required this.note, required this.doc});
  final NoteEntity note;
  final String doc;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        goTo(
            context,
            NoteView(
              note: note,
              docId: doc,
            ));
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.15,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: customDarkBlack),
        child: Row(
          children: [
            const Expanded(
                child: Icon(
              Icons.note,
              color: customWhite,
              size: 40,
            )),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              flex: 2,
              child: Text(
                note.noteTitle,
                maxLines: 4,
                style: const TextStyle(color: customWhite),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
      ),
    );
  }
}
