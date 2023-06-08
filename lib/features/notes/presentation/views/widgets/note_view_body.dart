import 'package:flutter/material.dart';
import 'package:notes_app_with_fire_base/core/entities/note_entity.dart';
import 'package:notes_app_with_fire_base/core/utils/constants/styles.dart';

class NoteViewBody extends StatelessWidget {
  const NoteViewBody({super.key, required this.note});
  final NoteEntity note;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              note.noteTitle,
              style: Styles.textStyle30.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                note.noteContent,
              ),
            )
          ],
        ),
      ),
    );
  }
}
